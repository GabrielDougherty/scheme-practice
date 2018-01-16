;; gets the last item in a list

;; if the list is empty, print "empty!"
;; If the end (cdr l) is empty, it is length 1, so we know the last element.
;; Otherwise, get the last element of the list without the first element (cdr l)

(define (last l)
  (cond ((null? l) (list ))
		((null? (cdr l)) (car l))
		(else (last (cdr l)))))


;; tests
(last (list)) ;; prints "empty!"
;; becomes
;; (last ()) <-- this is empty

(last (list 1 2 3 4)) ;; 4
;; becomes
;; (last (1 2 3 4))
;; (last (2 3 4))
;; (last (3 4))
;; (last (4))
;; 4

(last (list 'a 3 5 (+ 3 4))) ;; 7
;; becomes
;; (last ('a 3 5 7))
;; (last (3 5 7))
;; (last (5 7))
;; (last (7))
;; 7

;; Note the shape of the calls. Since the call stack doesn't grow, it is
;; a linear recursive procedure.
