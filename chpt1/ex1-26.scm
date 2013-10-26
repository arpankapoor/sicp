;; Louis Reasoner is having great difficulty doing exercise 1.24. His
;; fast-prime? test seems to run more slowly than his prime? test. Louis calls
;; his friend Eva Lu Ator over to help. When they examine Louis's code, they
;; find that he has rewritten the expmod procedure to use an explicit
;; multiplication, rather than calling square:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

;; "I don't see what difference that could make," says Louis. "I do." says Eva.
;; "By writing the procedure like that, you have transformed the theta(log n)
;; process into a theta(n) process." Explain.

;; By using explicit multiplication instead of square, 2 calls are being made
;; to the same function, i.e. a total of 2^n calls, whose order of growth is
;; (log 2^n) = n * (log 2) = theta(n)

;; On the other hand, the return value of the procedure is evaluated before
;; being sent to the procedure square. (Applicative order evaluation)
