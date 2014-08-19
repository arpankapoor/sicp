;; You can obtain an even more general version of accumulate by introducing the
;; notion of a filter on the terms to be combined. That is, combine only those
;; terms derived from values in the range that satisfy a specified condition.
;; The resulting filtered-accumulate abstraction takes the same arguments as
;; accumulate, together with an additional predicate of one argument that
;; specifies the filter. Write filtered-accumulate as a procedure.
(define (filtered-accumulate combiner filter null-value term a next b)
  (if (filter a)
      (if (> a b)
          null-value
          (combiner (term a)
                    (filtered-accumulate combiner
                                         filter
                                         null-value
                                         term
                                         (next a)
                                         next
                                         b)))
      (filtered-accumulate combiner
                           filter
                           null-value
                           term
                           (next a)
                           next
                           b)))

;; Show how to express the following using filtered-accumulate:
;; a. the sum of the squares of the prime numbers in the interval a to b
;;    (assuming that you have a prime? predicate already written)
(load "primality.scm")
(define (sum-of-prime-squares a b)
  (define (inc x) (+ x 1))
  (filtered-accumulate + prime? 0 square a inc b))

;; b. the product of all the positive integers less than n that are relatively
;;    prime to n (i.e., all positive integers i < n such that GCD(i, n) = 1)
(define (prod-rel-prime n)
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  (define (relatively-prime? i)
    (= (gcd i n) 1))
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (filtered-accumulate * relatively-prime? 1 identity 1 inc n))
