;; Produce a deep-reverse procedure that takes a list as argument and returns
;; as its value the list with its elements reversed and with all sublists
;; deep-reversed as well.
;; 
;; eg (define x (list (list 1 2) (list 3 4)))
;; => ((1 2) (3 4))
;; 
;; (reverse x)
;; => ((3 4) (1 2))
;;
;; (deep-reverse x)
;; => ((4 3) (2 1))
(define (reverse x)
  (if (null? x)
    (list)
    (append (reverse (cdr x))
            (list (car x)))))

(define (deep-reverse x)
  (cond ((null? x) (list))
        ((not (pair? x)) x)
        (else (append (deep-reverse (cdr x))
                      (list (deep-reverse (car x)))))))
