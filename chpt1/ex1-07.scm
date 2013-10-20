;; The good-enough? test used in computing square roots will not be very
;; effective for finding the square roots of very small numbers. Also, in real
;; computers, arithmetic operations are almost always performed with limited
;; precision. This makes our test inadequate for very large numbers.

;; Q. Explain these statements, with examples showing how the test fails for
;;    small and large numbers.

;; A. In the case of small numbers (< tolerance), the difference between the
;;    square of the guessed square root and the actual number is insignifiacnt
;;    with respect to the tolerance. So, the procedure that improves the guess
;;    runs only a few times until the test deems the guess good-enough.
;;    example: (sqrt 0.000001) gives 0.031260655525445276 (actual sqrt = 0.001)

;;    For large number (~ 10^13), the guess-improving procedure has to run a
;;    huge number of times to improve the guess significantly and bring it
;;    within the tolerance level.
;;    example: (sqrt 10000000000000) isn't computed in < 5min.


;; An alternative strategy for implementing good-enough? is to watch how guess
;; changes from one iteration to the next and to stop when the change is a very
;; small fraction of the guess. Design a square-root procedure that uses this
;; kind of end test.
(define (sqrt-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; Check if difference between subsequent guesses is lesser than 0.001 (could
;; be adjusted for higher accuracy) times the current guess.
(define (good-enough? curr-guess prev-guess)
  (< (abs (- curr-guess prev-guess)) (* 0.001 curr-guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Q. Does this work better for small and large numbers?
;; A. Sure, it does. Try the examples above.
