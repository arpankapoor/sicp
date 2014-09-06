;; return a list with sqaures of the elements of input list
(define (square-list items)
  (if (null? items)
    (list)
    (cons (square (car items))
          (square-list (cdr items)))))

;; method 2
(define (square-list items)
  (map square items))
