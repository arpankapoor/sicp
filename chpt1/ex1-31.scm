;; a. The sum procedure is only the simplest of a vast number of similar
;;    abstractions that can be captured as higher-order procedures. Write an
;;    analogous procedure called product that returns the product of the values
;;    of a function at points over a given range.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; Show how to define factorial in terms of product.
(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

;; Also use product to compute approximations to pi using the formula
;;
;;  pi     2 . 4 . 4 . 6 . 6 . 8 ...
;; ----- = -------------------------
;;   4     3 . 3 . 5 . 5 . 7 . 7 ...
;;
(define (pi-sum limit)
  (define (inc2 x) (+ x 2))
  (define num (product square 4 inc2 limit))
  (define den (product square 3 inc2 (- limit 1)))
  (exact->inexact (/ (* 2 (/ num limit))
                     den)))

;; b. If your product procedure generates a recursive process, write one that
;;    generates an iterative process. If it generates an iterative process,
;;    write one that generates a recursive process.
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))
