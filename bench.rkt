#lang racket

(require ffi/unsafe
         ffi/unsafe/define)

(require "tree-sitter.rkt")

;; Language def
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
               (cons 'begin acc)
               (loop (- i 1)
                     (cons (translate (node-child node (- i 1)))
                           acc)))))
        (("quote")
         (list 'quote (translate (node-child node 1))))
        (("list")
         (let loop ((i (node-named-child-count node))
                    (acc '()))
           (if (= i 0)
               acc
               (loop (- i 1)
                     (cons (translate (node-named-child node (- i 1)))
                           acc)))))
        (("string")
         (substring input
                    (+ (node-start-byte node) 1)
                    (- (node-end-byte node) 1)))
        (("symbol")
         (string->symbol (substring input (node-start-byte node) (node-end-byte node))))
        (("number")
         (string->number (substring input (node-start-byte node) (node-end-byte node))))
        (else
         (cons t (node->string node))))))
  (translate (tree-root-node (parser-parse-string p #f input))))

(require "peggen.rkt")

(generate-parser
 (Sexps
  (* Sexp)
  (lambda (i r)
    (map-match (lambda (m)
                 (cons 'begin m))
               r)))
 (Sexp
  (/ Quote List String Atom))
 (Quote
  (Spacing  "'" Sexp)
  (lambda (i r)
    (map-match (lambda (m)
                 (list 'quote (caddr m)))
               r)))
 (List
  (Spacing "(" (* Sexp) ")")
  (lambda (i r)
    (map-match caddr r)))
 (String
  (Spacing "\"" "[^\"]*" "\"")
  (lambda (i r)
    (map-match caddr r)))
 (Atom
  (/ Number Symbol))
 (Number
  (Spacing "[0-9]+(\\.[0-9]+)?")
  (lambda (i r)
    (map-match (lambda (m)
                  (string->number (cadr m)))
                r)))
 (Symbol
  (Spacing "[_@#a-zA-Z0-9\xC0-\xD6\xD8-\xDE\xDF-\xF6\xF8-\xFF:=><+*/?!^-]+")
  (lambda (i r)
    (map-match (lambda (m)
                 (string->symbol (cadr m)))
               r)))
 (Spacing
  (* (/ "[ \t\v\r\n]+" Comment))
  noop)
 (Comment
  ";[^\n]*"))

(define (parse-pg input)
  (match-match (Sexps input)))

(define input (let ((i (file->string "test.rkt"))
                    (size 20))
                (let loop ((acc i)
                           (s 0))
                  (if (= s size)
                      acc
                      (loop (string-append acc i)
                            (+ s 1))))))

(display "TreeSitter:    ")
(define ts (time (parse-ts input)))

(display "PEG generator: ")
(define pg (time (parse-pg input)))

(unless (equal? ts pg)
  (error "Results weren't the same!"))
