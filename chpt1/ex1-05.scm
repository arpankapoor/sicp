;; Ben Bitdiddle has invented a test to determine whether the interpreter he is
;; faced with is using applicative-order evaluation or normal-order evaluation.
;; He defines the following two procedures:
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Then he evaluates the expression

(test 0 (p))

;; Q. What behavior will Ben observe with an interpreter that uses
;;    applicative-order evaluation?
;; A. An applicative-order evaluation will cause an infinite loop, as it tries to
;;    evaluate the value of (p) which calls itself repeatedly.

;; Q. What behavior will he observe with an interpreter that uses normal-order
;;    evaluation?
;; A. (p) is not evaluated untill required, which in this case is never
;;    required, and 0 is output.
