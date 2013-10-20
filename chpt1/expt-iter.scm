;; Linear iteration to find exponential.
;; Requires theta(n) steps and theta(1) space.
(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

(define (expt b n)
  (expt-iter b n 1))
