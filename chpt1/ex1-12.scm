;; The following pattern of numbers is called Pascal's triangle.
;;
;;      1
;;     1 1
;;    1 2 1
;;   1 3 3 1
;;  1 4 6 4 1
;;
;; The numbers at the edge of the triangle are all 1, and each number inside
;; the triangle is the sum of the two numbers above it. Write a procedure that
;; computes elements of Pascal's triangle by means of a recursive process.

;; Return the next row of the pascal triangle, given the earlier one.
;; (without the edge 1s)
(define (nxt-pascal lst)
  (if (null? (cdr lst))
      (list)
      (cons (+ (car lst)
               (cadr lst))
            (nxt-pascal (cdr lst)))))

(define (pascal n)
  (cond ((= n 0) (list 1))
        ((= n 1) (list 1 1))
        (else (append (cons  1
                             (nxt-pascal (pascal (- n 1))))
                      (list 1)))))
