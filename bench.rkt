#lang racket

(require ffi/unsafe
         ffi/unsafe/define
         ffi/unsafe/alloc)

(define-ffi-definer define-ts
  (ffi-lib "/usr/lib/libtree-sitter" '(#f)))

;; Types
(define _TSParserRef (_cpointer 'TSParser))

(define _TSTreeRef (_cpointer 'TSTree))

(define _TSLanguageRef (_cpointer 'TSLanguage))

(define _TSRangeRef (_cpointer 'TSRange))

(define-cstruct _TSPoint ((row _uint32) (column _uint32)))

(define _TSInputEncoding
  (_enum '(TSInputEncodingUTF8 TSInputEncodingUTF16)))

(define _TSLogType
  (_enum '(TSLogTypeParse TSLogTypeLex)))

(define-cstruct _TSInput
  ((payload _pointer)
   (read (_fun (payload byte-index position bytes-read) ::
               (payload : _pointer)
               (byte-index : _uint32)
               (position : _TSPoint)
               (bytes-read : _uint32)
               -> _bytes))
   (encoding _TSInputEncoding)))

(define-cstruct _TSNode
  ((context (_array _uint32 4))
   (id _pointer)
   (tree _TSTreeRef)))

(define-cstruct _TSLogger
  ((payload _pointer)
   (log (_fun (payload typ message) ::
              (payload : _pointer)
              (typ : _TSLogType)
              (message : _string)
              -> _void))))

;; Parser
(define-ts parser-delete (_fun _TSParserRef -> _void)
  #:c-id ts_parser_delete
  #:wrap (deallocator))

(define-ts parser-new (_fun -> _TSParserRef)
  #:c-id ts_parser_new
  #:wrap (allocator parser-delete))

(define-ts parser-set-language (_fun _TSParserRef _TSLanguageRef -> _bool)
  #:c-id ts_parser_set_language)

(define-ts parser-get-language (_fun _TSParserRef -> _TSLanguageRef)
  #:c-id ts_parser_language)

(define-ts parser-set-included-ranges (_fun _TSParserRef _TSRangeRef _uint32 -> _bool)
  #:c-id ts_parser_set_included_ranges)

(define-ts parser-get-included-ranges (_fun _TSParserRef (_cpointer _uint32) -> _TSRangeRef)
  #:c-id ts_parser_included_ranges)

(define-ts parser-parse (_fun _TSParserRef _TSTreeRef _TSInput -> _TSTreeRef)
  #:c-id ts_parser_parse)

(define-ts parser-parse-string (_fun (parser old-tree source-code) ::
                                     (parser : _TSParserRef)
                                     (old-tree : (_cpointer/null 'TSTree))
                                     (source-code : _string)
                                     (_uint32 = (string-length source-code))
                                     -> _TSTreeRef)
  #:c-id ts_parser_parse_string)

(define-ts parser-parse-string-encoding (_fun (parser old-tree source-code encoding) ::
                                              (parser : _TSParserRef)
                                              (old-tree : (_cpointer/null 'TSTree))
                                              (source-code : _string)
                                              (_uint32 = (string-length source-code))
                                              (encoding : _TSInputEncoding)
                                              -> _TSTreeRef)
  #:c-id ts_parser_parse_string_encoding)

(define-ts parser-reset (_fun _TSParserRef -> _void)
  #:c-id ts_parser_reset)

(define-ts parser-set-timeout-micros (_fun _TSParserRef _uint64 -> _void)
  #:c-id ts_parser_set_timeout_micros)

(define-ts parser-get-timeout-micros (_fun _TSParserRef -> _uint64)
  #:c-id ts_parser_timeout_micros)

(define-ts parser-set-cancellation-flag (_fun _TSParserRef (_cpointer _size) -> _void)
  #:c-id ts_parser_set_cancellation_flag)

(define-ts parser-get-cancellation-flag (_fun _TSParserRef -> (_cpointer _size))
  #:c-id ts_parser_cancellation_flag)

(define-ts parser-set-logger (_fun _TSParserRef _TSLogger -> _void)
  #:c-id ts_parser_set_logger)

(define-ts parser-get-logger (_fun _TSParserRef -> _TSLogger)
  #:c-id ts_parser_logger)

(define-ts parser-print-dot-graphs (_fun (parser file-descriptor) ::
                                         (parser : _TSParserRef)
                                         (file-descriptor : _int)
                                         -> _void)
  #:c-id ts_parser_print_dot_graphs)

;; Tree
(define-ts tree-delete (_fun _TSTreeRef -> _void)
  #:c-id ts_tree_delete
  #:wrap (deallocator))

(define-ts tree-language (_fun _TSTreeRef -> _TSLanguageRef)
  #:c-id ts_tree_language)

(define-ts tree-copy (_fun _TSTreeRef -> _TSTreeRef)
  #:c-id ts_tree_copy)

(define-ts tree-root-node (_fun _TSTreeRef -> _TSNode)
  #:c-id ts_tree_root_node)

;; Node
(define-ts node-type (_fun _TSNode -> _string)
  #:c-id ts_node_type)

(define-ts node->string (_fun _TSNode -> _string)
  #:c-id ts_node_string)

(define-ts node-child-count (_fun _TSNode -> _uint32)
  #:c-id ts_node_child_count)

(define-ts node-child (_fun _TSNode _uint32 -> _TSNode)
  #:c-id ts_node_child)

(define-ts node-next-sibling (_fun _TSNode -> _TSNode)
  #:c-id ts_node_next_sibling)

(define-ts node-prev-sibling (_fun _TSNode -> _TSNode)
  #:c-id ts_node_prev_sibling)

(define-ts node-named-child-count (_fun _TSNode -> _uint32)
  #:c-id ts_node_named_child_count)

(define-ts node-named-child (_fun _TSNode _uint32 -> _TSNode)
  #:c-id ts_node_named_child)

(define-ts node-next-named-sibling (_fun _TSNode -> _TSNode)
  #:c-id ts_node_next_named_sibling)

(define-ts node-prev-named-sibling (_fun _TSNode -> _TSNode)
  #:c-id ts_node_prev_named_sibling)

(define-ts node-parent (_fun _TSNode -> _TSNode)
  #:c-id ts_node_parent)

(define-ts node-is-null (_fun _TSNode -> _bool)
  #:c-id ts_node_is_null)

(define-ts node-is-named (_fun _TSNode -> _bool)
  #:c-id ts_node_is_named)

(define-ts node-child-by-field-name (_fun _TSNode _string _uint32 -> _TSNode)
  #:c-id ts_node_child_by_field_name)

(define-ts node-start-byte (_fun _TSNode -> _uint32)
  #:c-id ts_node_start_byte)

(define-ts node-end-byte (_fun _TSNode -> _uint32)
  #:c-id ts_node_end_byte)

;; Language def
(define-ffi-definer define-lang
  (ffi-lib "./test" '(#f)))

(define-lang test (_fun -> _TSLanguageRef)
  #:c-id tree_sitter_test)

(define p (parser-new))
(parser-set-language p (test))

(define (parse input)
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

(pretty-print (time (parse (file->string "bench.rkt"))))
