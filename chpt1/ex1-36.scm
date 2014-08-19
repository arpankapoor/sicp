;; Modify fixed-point so that it prints the sequence of approximations it
;; generates, using the newline and display primitives.
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (begin (newline)
                 (display guess)
                 (try next)))))
  (try first-guess))

;; Then find a solution to x^x = 1000 by finding a fixed point of x ->
;; log(1000)/log(x).
;; (Note that you cannot start fixed-point with a guess of 1, as this would
;; cause division by log(1) = 0.)
(fixed-point (lambda (x) (/ (log 1000)
                            (log x)))
             1.1)
;4.5555

;; Compare the number of steps this takes with and without average damping.
