#lang racket

(provide balanced?)

(define brackets (hash #\( #\)
                       #\[ #\]
                       #\{ #\}))
(define closing-brackets
  (set #\) #\] #\}))

(define (balanced? str)
  (for/fold ([brackets-to-close '()]
             [wrong-bracket #f]
             #:result (and (not wrong-bracket) (empty? brackets-to-close)))
            ([char str])
    (cond
      [(hash-has-key? brackets char)
       (values
        (cons (hash-ref brackets char) brackets-to-close)
        wrong-bracket)]
      [(set-member? closing-brackets char)
       (if (and (not (empty? brackets-to-close))
                (equal? (car brackets-to-close) char))
           (values
            (cdr brackets-to-close)
            wrong-bracket)
           (values
            brackets-to-close
            #t))]
      [else (values brackets-to-close wrong-bracket)])))
