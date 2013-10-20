;; Define a procedure that takes three numbers as arguments and returns the
;; sum of the squares of the two larger numbers.
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-larger a b c)
  (cond ((> a b)
         (sum-of-squares a (if (> b c) b c)))
        ((> b a)
         (sum-of-squares b (if (> a c) a c)))
        ((> c a)
         (sum-of-squares c (if (> a b) a b)))))
