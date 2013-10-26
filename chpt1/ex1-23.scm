;; The smallest-divisor procedure shown at the start of this section does lots
;; of needless testing. After it checks to see if the number is divisible by 2
;; there is no point in checking to see if it is divisible by any larger even
;; numbers. This suggests that the values used for test-divisor should not be
;; 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... To implement this change,
;; define a procedure next that returns 3 if its input is equal to 2 and
;; otherwise returns its input plus 2.
(define (next m)
  (if (= m 2)
      3
      (+ m 2)))

;; Modify the smallest-divisor procedure to use (next test-divisor) instead of
;; (+ test-divisor 1).
(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

;; With timed-prime-test incorporating this modified version of
;; smallest-divisor, run the test for each of the 12 primes found in exercise
;; 1.22. 
(load "ex1-22")
;1009 *** 0.
;1013 *** 0.
;1019 *** 0.
;10007 *** 0.
;10009 *** 0.
;10037 *** 0.
;10000000019 *** .10999999999999999
;10000000033 *** .10999999999999999
;10000000061 *** .10999999999999999
;100000000003 *** .34999999999999987
;100000000019 *** .3400000000000001
;100000000057 *** .3599999999999999

;; Q. Since this modification halves the number of test steps, you should expect
;;    it to run about twice as fast. Is this expectation confirmed? If not,
;;    what is the observed ratio of the speeds of the two algorithms, and how
;;    do you explain the fact that it is different from 2?
;;
;; A. This algorithm runs ~1.5 times faster than the previous one.
;;    This deviation from 2 may be attributed to the fact that, before each
;;    increment of the test-divisor, it is checked for equality with 2.
