;; Write a procedure same-parity that takes one or more integers and returns a
;; list of all the arguments that have the same even-odd parity as the first
;; argument.
(define (same-parity x . y)
  (define (iter lst)
    (if (null? lst)
      (list)
      (if (= (remainder x 2)
             (remainder (car lst) 2))
        (cons (car lst)
              (iter (cdr lst)))
        (iter (cdr lst)))))
  (iter (cons x y)))
