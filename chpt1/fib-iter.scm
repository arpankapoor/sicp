;; Iterative process to generate Fibonacci numbers using the transformation
;; a <- a + b
;; b <- a
(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 n))
