;; Demonstrate that the Carmichael numbers 561, 1105, 1729, 2465, 2821, and
;; 6601 really do fool the Fermat test. That is, write a procedure that takes
;; an integer n and tests whether a^n is congruent to a modulo n for every a<n,
;; and try your procedure on the given Carmichael numbers.
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (strong-fermat-test n)
  (define (try count)
    (cond ((= count n) #t)
          ((= (expmod count n n) count)
           (try (+ count 1)))
          (else #f)))
  (try 1))

(newline)
(display (strong-fermat-test 561))
(newline)
(display (strong-fermat-test 1105))
(newline)
(display (strong-fermat-test 1729))
(newline)
(display (strong-fermat-test 2465))
(newline)
(display (strong-fermat-test 2821))
(newline)
(display (strong-fermat-test 6601))
;; All the above tests output #t.
