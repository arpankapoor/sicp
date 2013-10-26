;; Find if a given number is prime

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

;; Find the smallest divisor of n other than 1
(define (smallest-divisor n)
  (find-divisor n 2))

;; A number is prime if its smallest divisor (other than 1) is the number
;; itself.
(define (prime? n)
  (if (= n 1)
      #f
      (= n (smallest-divisor n))))

;; Order of growth is theta(sqrt(n))
;; GOTO Exercise 1.23 to verify this.
