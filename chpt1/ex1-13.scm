;; Prove that Fib(n) is the closest integer to p^n/sqrt(5), where
;; p = (1 + sqrt(5))/2. Hint: Let q = (1 - sqrt(5))/2. Use induction and the
;; definition of the Fibonacci numbers to prove that
;; Fib(n) = (p^n - q^n)/sqrt(5).

;; Proof by induction:
;; 1. Fib(0) = (p^0 - q^0)/sqrt(5)
;;           = (1 - 1)/sqrt(5)
;;           = 0
;; 2. Assume,
;;      Fib(k) = (p^k - q^k)/sqrt(5)
;;
;; 3. (p and q are roots of the quadratic equation
;;          x^2 = x + 1,
;;     Hence, p^2 = p + 1
;;            q^2 = q + 1)
;;    Fib(k+1) = (p^(k+1) - q^(k+1))/sqrt(5)
;;             = (p^2 * p^(k-1) - q^2 * q^(k-1))/sqrt(5)
;;     (Substituting p^2 = p + 1
;;                   q^2 = q + 1)
;;             = ((p+1) * p^(k-1) - (q+1) * q^(k-1))/sqrt(5)
;;             = ((p^k + p^(k-1)) - (q^k + q^(k-1)))/sqrt(5)
;;               (p^k - q^k)     (p^(k-1) - q^(k-1))
;;             = -----------  +  -------------------
;;                 sqrt(5)             sqrt(5)
;;             = Fib(k) + Fib(k-1)
;;    Q.E.D.
(define p
  (/ (+ 1
        (sqrt 5))
     2))

(define q
  (/ (- 1
        (sqrt 5))
     2))

(define (fib n)
  (/ (- (expt p n)
        (expt q n))
     (sqrt 5)))
