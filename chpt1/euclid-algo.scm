;; Euclid's algorithm to find the GCD of two numbers.
;; GCD(a, b) = GCD(b, r)    (where r is the remainder of a divided by b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
