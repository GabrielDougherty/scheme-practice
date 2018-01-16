;; my attempt to implement list-ref
;; the idea is, pass a list and a zero-indexed depth, and it returns the
;; item at that depth

;; loop up version
(define (my-list-ref l depth)
  (define (list-traverse l-part i)
	(if (= depth i)
		(car l-part)
		(list-traverse (cdr l-part) (+ i 1))))
  (list-traverse l 0))

;; loop down version (credit Andy Balaam)
;; https://www.youtube.com/watch?v=Qqext1NwmqM
(define (my-list-ref lst n)
  (if (zero? n)
	  (car lst)
	  (my-list-ref (cdr lst) (- n 1))))
