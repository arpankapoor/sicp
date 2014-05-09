;; Fermat's Little Theorem
;;  If n is a prime number number and a is any positive integer less than n,
;;  then a raised to the nth power is congruent to a modulo n.

;; To check the primality of n, pick a random number a < n and compute the
;; remainder of a^n modulo n.
;; If the result is not equal to a, then n is certainly not prime.
;; If it is a, then n "could be" prime.

;; By repeating the above cycle a given number of times, we can increase the
;; probability of the number being prime.
;; This is known as the FERMAT TEST.

;; Compute the remainder on dividing base^exp by m
;; i.e. base^exp modulo m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

;; Return #t if n passes Fermat test for a random number less than n, #f
;; otherwise.
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;; Repeated runs of the above procedure
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
