;; The result is reversed because as the procedure iterates over the list it
;; puts the square of the first item on the front of the answer list.
;; The square of the first item of the input list is the first item to be
;; placed at the front of the answer list.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items '()))

;; produces a weird result.
;; syntax error: cons takes an item and a LIST as arguments.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items '()))

;; Corrected code
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (append answer
                    (list (square (car things)))))))
  (iter items '()))
