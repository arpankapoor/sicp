;; Modify the make-account procedure so that it creates password-protected
;; accounts. That is, make-account should take a symbol as an additional
;; argument, as in
;;
;; (define acc (make-account 100 'secret-password))
;;
;; The result account object should process a request only if it is accompanied
;; by the password with which the account was created, and should otherwise
;; return a complaint:
;;
;; ((acc 'secret-password 'withdraw) 40)
;; => 60
;;
;; ((acc 'some-other-password 'deposit) 50)
;; => "Incorrect password"
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define(deposit amount)
    (begin (set! balance (+ balance amount))
           balance))
  ;; The below procedure returns a procedure.
  (define (dispatch p m)
    (if (eq? p password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))
        (lambda (x)
          "Incorrect password")))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
