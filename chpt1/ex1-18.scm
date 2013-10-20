;; Using the results of exercises 1.16 and 1.17, devise a procedure that
;; generates an iterative process for multiplying two integers in terms of
;; adding, doubling, and halving and uses a logarithmic number of steps.
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (*-iter a b prod)
  (cond ((= b 0) prod)
        ((even? b) (*-iter (double a)
                           (halve b)
                           prod))
        (else (*-iter a (- b 1) (+ a prod)))))

(define (* a b)
  (*-iter a b 0))

;; This algorithm, which is sometimes known as the "Russian peasant method" of
;; multiplication, is ancient. Examples of its use are found in Rhind Papyrus,
;; one of the two oldest mathematical documents in existence, written about
;; 1700 B.C. (and copied from an even older document) by an Egyptian scribe
;; named A'h-mose.
