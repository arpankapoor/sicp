;; Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime?
;; (the Fermat method), and test each of the 12 primes you found in that
;; exercise.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1000)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (search-for-primes start count)
  (cond ((= count 0) "Done")
        ((fast-prime? start 1000)
         (timed-prime-test start)
         (search-for-primes (next start)
                            (- count 1)))
        (else (search-for-primes (next start)
                                 count))))

(load "fermat-test")
(search-for-primes 10000000000 3)               ;10^10
;10000000019 *** .10999999999999943
;10000000033 *** .10999999999999943
;10000000061 *** .10999999999999943

(search-for-primes 100000000000000000000 3)     ;10^20
;100000000000000000039 *** .2400000000000002
;100000000000000000129 *** .2400000000000002
;100000000000000000151 *** .2400000000000002

;; Q. Since the Fermat test has theta(log n) growth, how would you expect the
;;    time to test primes near 1,000,000 to compare with the time needed to
;;    test primes near 1000? Do your data bear this out? Can you explain any
;;    discrepancy you find?
;;
;; A. The runtime for 10^20 (square of 10^10) is nearly double that of 10^10,
;;    which is as expected.
