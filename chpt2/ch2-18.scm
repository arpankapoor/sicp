;; list -> list
;; returns a list of the same elements in reverse order
(define (reverse l)
  (if (null? l)
    (quote ())
    (append (reverse (cdr l))
            (list (car l)))))
