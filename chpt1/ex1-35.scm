;; Show that the golden ratio is a fixed point of the transformation x -> 1
;; + 1/x, and use this fact to compute the golden ratio by means of the
;; fixed-point procedure.

;; Let p = golden ratio
;; p^2 = p + 1
;; p = 1 + 1/p

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define golden-ratio
  (fixed-point (lambda (p) (+ 1
                              (/ 1 p)))
               1.0))
