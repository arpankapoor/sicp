;; Simpson's Rule is a more accurate method of numerical integration that the
;; method illustrated above. Using Simpson's Rule, the integral of a function f
;; between a and b is approximated as
;;
;;  h [y0 + 4y1 + 2y2 + 4y3 + 2y4+ ... + 2y(n-2) + 4y(n-1) + y(n)]
;; ---------------------------------------------------------------
;;                             3
;;
;; where h = (b-a)/n, for some, even integer n, and
;;       y(k) = f(a + kh).
;; (Increasing n increases the accuracy of the approximation.)
;; Define a procedure that takes as arguments f, a, b, and n and returns the
;; value of the integral, computed using Simpson's Rule.
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simp-int f a b n)
  (define h (/ (- b a)
               n))
  (define (y k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (f (+ a (* k h)))))
  (define (inc x) (+ x 1))
  (* (/ h 3)
     (sum y 0 inc n)))

;; Use your procedure to integrate cube between 0 and 1 (with n = 100 and n =
;; 1000), and compare the results to those of the integral procedure shown
;; above.
(define (cube x) (* x x x))
(simp-int cube 0 1 100)     ; 1/4
(simp-int cube 0 1 1000)    ; 1/4
