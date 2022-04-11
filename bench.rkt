#lang racket

;; Simple, basic AST used in the benchmark.
(struct ast-sequence (exprs start end) #:transparent)
(struct ast-quote (expr start end) #:transparent)
(struct ast-list (value start end) #:transparent)
(struct ast-string (value start end) #:transparent)
(struct ast-symbol (value start end) #:transparent)
(struct ast-number (value start end) #:transparent)

;; Tree Sitter
(require ffi/unsafe
         ffi/unsafe/define)

(require "tree-sitter.rkt")

(define-ffi-definer define-lang
  (ffi-lib "./test" '(#f)))

(define-lang test (_fun -> _TSLanguageRef)
  #:c-id tree_sitter_test)

(define p (parser-new))
(parser-set-language p (test))

(define (parse-ts input)
  (define (translate node)
    (let ((t (node-type node)))
      (case t
        (("sexps")
         (let loop ((i (node-child-count node))
                    (acc '()))
           (if (= i 0)
               (ast-sequence acc
                             (node-start-byte node)
                             (node-end-byte node))
               (loop (- i 1)
                     (cons (translate (node-child node (- i 1)))
                           acc)))))
        (("quote")
         (ast-quote (translate (node-child node 1))
                    (node-start-byte node)
                    (node-end-byte node)))
        (("list")
         (let loop ((i (node-named-child-count node))
                    (acc '()))
           (if (= i 0)
               (ast-list acc
                         (node-start-byte node)
                         (node-end-byte node))
               (loop (- i 1)
                     (cons (translate (node-named-child node (- i 1)))
                           acc)))))
        (("string")
         (ast-string (substring input
                                (+ (node-start-byte node) 1)
                                (- (node-end-byte node) 1))
                     (node-start-byte node)
                     (node-end-byte node)))
        (("symbol")
         (ast-symbol (string->symbol (substring input (node-start-byte node) (node-end-byte node)))
                     (node-start-byte node)
                     (node-end-byte node)))
        (("number")
         (ast-number (string->number (substring input (node-start-byte node) (node-end-byte node)))
                     (node-start-byte node)
                     (node-end-byte node)))
        (else
         (error "Parser did not parse the file correctly.")))))
  (translate (tree-root-node (parser-parse-string p #f input))))

(require "peggen.rkt")
(require (for-syntax "peggen.rkt"))

(define-syntax (generate-parser stx)
  (syntax-case stx ()
    ((generate-parser rules ...)
     (datum->syntax stx
                    (generate-grammar
                     (syntax->datum #'(rules ...)))))))

(generate-parser
 (Sexps
  ((* Sexp) Spacing)
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-sequence (car m)
                               (match-start r)
                               (match-end r)))
               r)))
 (Sexp
  (/ Quote List String Atom))
 (Quote
  (Spacing  "'" Sexp)
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-quote (caddr m)
                            (match-start r)
                            (match-end r)))
               r)))
 (List
  (Spacing "(" (* Sexp) Spacing ")")
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-list (caddr m)
                           (match-start r)
                           (match-end r)))
               r)))
 (String
  (Spacing "\"" "[^\"]*" "\"")
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-string (caddr m)
                             (match-start r)
                             (match-end r)))
               r)))
 (Atom
  (/ Number Symbol))
 (Number
  (Spacing "[0-9]+(\\.[0-9]+)?")
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-number (string->number (cadr m))
                             (match-start r)
                             (match-end r)))
               r)))
 (Symbol
  (Spacing "[_@#a-zA-Z0-9:=><+*/?!^-]+")
  (lambda (i r)
    (map-match (lambda (m)
                 (ast-symbol (string->symbol (cadr m))
                             (match-start r)
                             (match-end r)))
               r)))
 (Spacing
  (: (* (/ "[ \t\v\r\n]+" Comment)))
  noop)
 (Comment
  ";[^\n]*"))

(define (parse-pg input)
  (let ((result (Sexps input)))
    (if (matches? result)
        (match-match result)
        (error "Parser did not parse the file correctly."))))

;; Benchmark

(define (input filename duplicates)
  (let ((i (file->string filename)))
    (let loop ((acc "")
               (s 0))
      (if (= s duplicates)
          acc
          (loop (string-append acc i)
                (+ s 1))))))

(define (iota from to step)
  (if (> from to)
      '()
      (cons from (iota (+ from step) to step))))

(define (bench f filename sizes)
  (map (lambda (s)
         (let ((i (input filename s)))
           (let-values (((_ cpu real gc)
                         (time-apply (lambda ()
                                       (f i))
                                     '())))
             (format "~ams" real))))
       sizes))

(require racket/format)

(define (display-result result)
  (map (lambda (i)
         (display (~a i
                      #:align 'right
                      #:width 7)))
       result)
  (newline))

(define (run-bench filename sizes)
  (displayln (format "~a duplicated ~a times:" filename sizes))
  (display "# lines:       ")
  (display-result (let ((s (length (file->lines filename))))
                    (map (lambda (i)
                           (* s i))
                         sizes)))

  (display "TreeSitter:    ")
  (display-result (bench parse-ts filename sizes))

  (display "PEG generator: ")
  (display-result (bench parse-pg filename sizes)))

;; Sanity checks
(define (check-equal? a b)
  (unless (equal? a b)
    (with-output-to-file "/tmp/a.txt"
      (lambda ()
        (pretty-print a))
      #:exists 'replace)
    (with-output-to-file "/tmp/b.txt"
      (lambda ()
        (pretty-print b))
      #:exists 'replace)
    (error "Results weren't the same!")))

(check-equal? (parse-ts "")
              (parse-pg ""))

(check-equal? (parse-ts "#lang test")
              (parse-pg "#lang test"))

(check-equal? (parse-ts (file->string "test/nodes.rkt"))
              (parse-pg (file->string "test/nodes.rkt")))

(check-equal? (parse-ts (file->string "test/small.rkt"))
              (parse-pg (file->string "test/small.rkt")))

(check-equal? (parse-ts (file->string "test/large.rkt"))
              (parse-pg (file->string "test/large.rkt")))

;; Actual benchmark
(run-bench "test/nodes.rkt" (iota 0 5000 500))
(newline)
(run-bench "test/small.rkt" (iota 0 1000 100))
(newline)
(run-bench "test/large.rkt" (iota 0 50 5))
