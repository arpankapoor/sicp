;; Recursive definition to find exponential.
;; Requires theta(n) steps and space.
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
