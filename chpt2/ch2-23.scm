;; similar to map
;; just apply the procedure proc to each element of the list
(define (for-each proc lst)
  (cond ((null? lst) #t)
        (else (proc (car lst))
              (for-each proc (cdr lst)))))
