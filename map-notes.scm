;; Map notes from Andy Balaam video
;; https://www.youtube.com/watch?v=Qqext1NwmqM

;; This is a custom implementation of map, credit Andy
;; The idea with map is, it expects a function and a list, and applies the 
;; function to each element of the list
;;
;; It's implemented by consing (pairing) the function applied to the first
;; element with the map of the cdr of the list (the rest of the list). In
;; this way, the function is recursively applied to the list.
(define (my-map fn lst)
  (if (null? lst) ;; end of the list
	  (list ) ;; ugly null
	  (cons (fn (car lst)) (my-map fn (cdr lst)))))



;; My iterative recursive attempt
;; This solution just applies the function element by element, and stores the
;; new ones in a new list.
;;
;; Remember, lists look like this:
;; (cons 1 (cons 2 (cons 3 (cons 4 ( cons 5 null)))))
;;
;; Due to the structure of the list, the iterative solution reverses the list.
;; So, I just apply it twice. Once, to reverse it (with identity function)
;; and again to apply the function to each element and reverse it again.
(define (my-map fn lst)
  ;; this is map, but makes the list backwards
  (define (reverse-map rev-fn rev-lst)
	(define (iter-reverse-map todo-lst done-lst)
	  (define (new-done-lst)
		(cons (rev-fn (car todo-lst)) done-lst))
	  (if (null? todo-lst)
		  done-lst
		  (iter-reverse-map (cdr todo-lst) (new-done-lst))))
	(iter-reverse-map rev-lst (list )))

  ;; just apply it with the identity function to make it reverse
  (define reverse-lst
	(reverse-map identity lst))
  ;; then this does map and reverses the reverse list
  (reverse-map fn reverse-lst))
  ;; (reverse (reverse-map lst )) ;; another way, using built-in reverse

