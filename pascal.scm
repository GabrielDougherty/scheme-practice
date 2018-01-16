;; Pascal's Triangle
;; I'll do (pascal row col)
;; zero-indexed

;; original
(define (pascal row col)
  (cond ((= row col) 1)
		((= col 0) 1)
		(else (+ (pascal (- row 1) (- col 1))
				 (pascal (- row 1) col)))))

;; more readable
(define (pascal row col)
  (define (sum-above-two)
    (+ (pascal (- row 1) (- col 1))
       (pascal (- row 1) col)))
  (cond ((= row col) 1)
        ((= col 0) 1)
        (else (sum-above-two))))
