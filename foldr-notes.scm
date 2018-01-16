;; Fold notes from Andy Balaam video
;; https://www.youtube.com/watch?v=Qqext1NwmqM



;; Fold pretty much just applies a function to every element in the list, and
;; combines all of those results, then returns the result
;; foldr traverses the list left to right. foldl traverses right to left
;; See: https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._foldl%29%29


;; his recursive foldr
(define (my-foldr fn start lst)
  (if (null? lst)
	  start
	  (fn (car lst) (my-foldr start (cdr lst)))))

;; my foldl
;; This runs in constant space. It's kind of ugly right now
(define (my-foldl fn start lst)
  (define (iter-foldl iter-lst result first-run)
	;; if the list is empty, there is no new result to calculate
	;; if it's the first run and the last condition is false, the "result"
	;; variable is invalid, don't use it, but calculate the new one using the
	;; first item in the list.
	;; otherwise, the new result is the fn of the next item in the list and the
	;; old result.
	(define new-result
	  (cond ((null? iter-lst) (list ))
			(first-run (fn (car iter-lst)))
			(else (fn (car iter-lst) result))))

	;; if the list is null (empty), fold the start and the last result
	;; otherwise, fold the rest of the list
	(if (null? iter-lst)
		(fn start result)
		(iter-foldl (cdr iter-lst) new-result #f)))

  (iter-foldl lst (list ) #t))
