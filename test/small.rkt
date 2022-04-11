#lang racket

(define fail-stack (box '()))

(define (current-continuation)
  (call/cc (lambda (k) (k k))))

(define (fail)
  (let ((s (unbox fail-stack)))
    (if (null? s)
        (raise "backtracking stack exhausted!")
        (let ((point (car s)))
          (set-box! fail-stack (cdr s))
          (point point)))))

(define (amb choices)
  (let ((mut-choices (box choices)))
    (let* ((cc (current-continuation))
           (cs (unbox mut-choices)))
      (if (null? cs)
          (fail)
          (let ((c (car cs)))
            (set-box! mut-choices (cdr cs))
            (set-box! fail-stack (cons cc
                                       (unbox fail-stack)))
            c)))))

(define (assert condition)
  (unless condition
    (fail)))

(define (iota from to)
  (if (> from to)
      '()
      (cons from (iota (+ 1 from) to))))

;; Find all pythagorean triangles for lengths between 1 and 50, no duplicates.
(let ((a (amb (iota 1 50)))
      (b (amb (iota 1 50)))
      (c (amb (iota 1 50))))
  (assert (= (* c c)
             (+ (* a a)
                (* b b))))
  (assert (< b a))
  (display (list a b c))
  (newline)
  (fail))
