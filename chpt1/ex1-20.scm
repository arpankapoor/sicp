;; The process that a procedure generates is of course dependent on the rules
;; used by the interpreter. As an example, consider the iterative gcd
;; procedure. Suppose we were to interpret this procedure using normal-order
;; evaluation. 
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;; Q. Using the substitution method (for normal order), illustrate the
;;    process generated in evaluating (gcd 206 40) and indicate the remainder
;;    operations that are actually performed.
;; A. (gcd 206 40)
;;    (gcd 40 (remainder 206 40))
;;    (if (= (remainder 206 40) 0)
;;        40
;;        (gcd (remainder 206 40)
;;             (remainder 40 (remainder 206 40))))
;;    (if (= 6 0)
;;        40
;;        (gcd (remainder 206 40)
;;             (remainder 40 (remainder 206 40))))
;;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;    (if (= (remainder 40 (remainder 206 40)))
;;        (remainder 206 40)
;;        (gcd (remainder 40 (remainder 206 40))
;;             (remainder (remainder 206 40)
;;                        (remainder 40 (remainder 206 40)))))
;;    .
;;    .
;;    .

;; Q. How many remainder operations are actually performed in the normal-order
;;    evaluation of (gcd 206 40)?
;; A. 19
;;    (In general, for a k step process, 5*2^(k-2) - 1 remainder operations are
;;    performed.)

;; Q. In the applicative-order evaluation?
;; A. 4
;;    (In general, for a k step process, k remainder operations are performed.)
