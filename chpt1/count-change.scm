;; Number of ways to change amount a using n kinds of coins
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount                 ; Number of ways to change a using
                     (- kinds-of-coins 1))  ; all but the first kind of coin
                 (cc (- amount                              ; No. of ways to
                        (first-denomination kinds-of-coins)); change a using
                     kinds-of-coins)))))                    ; atleast 1 coin of the first kind

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (count-change amount)
  (cc amount 5))
