;; Most Lisp implementations include a primitive called runtime that returns an
;; integer that specifies the amount of time the system has been running
;; (measured, for example, in microseconds). The following time-prime-test
;; procedure, when called with an integer n, prints n and checks to see if n is
;; prime. If n is prime, the procedure prints three asterisks followed by the
;; amount of time used in performing the test.
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;; Load the prime? procedure
;; (load "primality")

;; Using this procedure, write a procedure search-for-primes that checks the
;; primality of consecutive odd integers in a specified range.
(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (search-for-primes start count)
  (cond ((= count 0) "Done")
        ((prime? start) (timed-prime-test start)
                        (search-for-primes (next start)
                                           (- count 1)))
        (else (search-for-primes (next start)
                                 count))))

;; Use your procedure to find the three smallest primes larger than 1000;
;; larger than 10,000; larger than 1,000,000.
(search-for-primes 1000 3)
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.
(search-for-primes 10000 3)
;10007 *** 0.
;10009 *** 0.
;10037 *** 0.

;; Q. Note the time needed to test each prime. Since the testing algorithm has
;;    order of growth theta(sqrt(n)), you should expect that testing for primes
;;    around 10,000 should take about sqrt(10) times as long as testing for
;;    primes around 1000. Do your timing data bear this out? How well do the
;;    data for 100,000 and 1,000,000 support the sqrt(n) prediction? Is your
;;    result compatible with the notion that programs on your machine run in
;;    time proportional to the number of steps required for the computation?
;;
;; A. On my sytem, the runtime starts assuming a non-zero value only at ~10^8.
;;    It accurately verifies the claim of the order of growth being sqrt(10).

(search-for-primes 10000000000 3)       ;10^10
;10000000019 *** .1700000000000017
;10000000033 *** .1700000000000017
;10000000061 *** .1699999999999946

(search-for-primes 100000000000 3)      ;10^11
;100000000003 *** .5399999999999991     sqrt(10) * .17 = .537
;100000000019 *** .5399999999999991     This is awsome.
;100000000057 *** .5500000000000043
