;; return the list that contains only the last
;; element of a given (nonempty) list
(define (last-pair l)
  (if (null? (cdr l))
    (list (car l))
    (last-pair (cdr l))))
