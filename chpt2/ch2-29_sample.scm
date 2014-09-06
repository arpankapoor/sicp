(define b1 (make-branch 20 1))
(define b2 (make-branch 11 3))
(branch-length b1) ;; 20
(branch-structure b2) ;; 3

(define m1 (make-mobile b1 b2))
(left-branch m1) ;; (20 1)
(right-branch m1) ;; (11 3)
(branch-structure (left-branch m1)) ;; 1

(define b3 (make-branch 11 m1))
(branch-length b3) ;; 11
(branch-structure b3) ;; ((20 1) (11 3))
(define m2 (make-mobile b2 b3))
(left-branch m2) ;; (11 3)
(right-branch m2) ;; (11 ((20 1) (11 3)))
(branch-structure (right-branch m2)) ;; ((20 1) (11 3))

(total-weight m1) ;; 4
(total-weight m2) ;; 7

(balanced? m1) ;; #f
(balanced? m2) ;; #f

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 10 a) (make-branch 12 5)))

(balanced? a) ;; #t
(balanced? b) ;; #t
