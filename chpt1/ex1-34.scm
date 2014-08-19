;; Suppose we define the procedure
(define (f g)
  (g 2))
;; Then we have
(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

;; Q. What happens if we (perversely) ask the interpreter to evaluate the
;;    combination (f f)? Explain.
;; A. It'll result in an error.
;;    (f f)
;;    (f 2)
;;    (2 2) <- Doesn't make sense, since 2 isn't an operator.
