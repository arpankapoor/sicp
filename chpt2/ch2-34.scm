;; Produce a procedure that evaluates a polynomial using Horner's rule. Assume
;; that the coefficients of the polynomial are arranged in a sequence, from a0
;; through an.
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

;; Horner's rule
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-term)
                (+ this-coeff
                   (* x higher-term)))
              0
              coefficient-sequence))
