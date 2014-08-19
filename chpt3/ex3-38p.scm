;; Suppose that Peter, Paul, and Mary share a joint bank account that initially
;; contains $100. Concurrently, Peter deposits $10, Pail withdraws $20, and
;; Mary withdraws half the money in the account, by executing the following
;; commands:
;; Peter: (set! balance (+ balance 20))
;; Paul:  (set! balance (- balance 20))
;; Mary:  (set! balance (- balance (/ balance 2)))
;;
;; a. List all the different possible values for balance after these three
;;    transactionshave been completed, assuming that the banking system forces
;;    the three processes to run sequentially in some order.
(define balance 100)
(set! balance (- balance (/ balance 2)))    ; Mary
(set! balance (- balance 20))               ; Paul
(set! balance (+ balance 20))               ; Peter
(display balance)       ; 50
(newline)

(define balance 100)
(set! balance (- balance (/ balance 2)))    ; Mary
(set! balance (+ balance 20))               ; Peter
(set! balance (- balance 20))               ; Paul
(display balance)       ; 50
(newline)

(define balance 100)
(set! balance (- balance 20))               ; Paul
(set! balance (- balance (/ balance 2)))    ; Mary
(set! balance (+ balance 20))               ; Peter
(display balance)       ; 60
(newline)

(define balance 100)
(set! balance (- balance 20))               ; Paul
(set! balance (+ balance 20))               ; Peter
(set! balance (- balance (/ balance 2)))    ; Mary
(display balance)       ; 50
(newline)

(define balance 100)
(set! balance (+ balance 20))               ; Peter
(set! balance (- balance (/ balance 2)))    ; Mary
(set! balance (- balance 20))               ; Paul
(display balance)       ; 40
(newline)

(define balance 100)
(set! balance (+ balance 20))               ; Peter
(set! balance (- balance 20))               ; Paul
(set! balance (- balance (/ balance 2)))    ; Mary
(display balance)       ; 50
(newline)

;; What are some other values that could be produced if the system allows the
;; processes to be interleaved? Draw timing diagrams to explain how these
;; values can occur.
