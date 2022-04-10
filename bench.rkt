#lang racket

(require ffi/unsafe
         ffi/unsafe/define
         racket-tree-sitter/definer)


(define-ffi-definer define-ts
  (ffi-lib "./test" '(#f)))

(define-ts test (_fun -> _TSLanguageRef)
  #:c-id tree_sitter_test)

(define p (parser-new))
(set-language p (test))


(displayln (node->string (root-node (parse-string p #f "hello"))))
