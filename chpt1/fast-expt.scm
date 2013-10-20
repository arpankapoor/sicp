;; Compute exponential (b^n) using the rules:
;; 1. b^n = square(b^(n/2))     if n is even
;; 2. b^n = b * b^(n-1)         if n is odd
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Grows logarithmically with n in both space and number of steps.
