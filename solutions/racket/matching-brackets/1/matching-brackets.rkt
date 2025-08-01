#lang racket

(provide balanced?)

(define brackets (hash #\( #\)
                       #\[ #\]
                       #\{ #\}))
(define closing-brackets
  (set #\) #\] #\}))


(define (balanced? str)
  (equal? (for/fold ([brackets-opened '()])
                    ([char str])
             (cond
               [(hash-has-key? brackets char)
                (cons (hash-ref brackets char) brackets-opened)]
               [(set-member? closing-brackets char)
                (if (and (not (empty? brackets-opened))
                         (equal? (car brackets-opened) char))
                    (cdr brackets-opened)
                    (cons false brackets-opened))]
               [else brackets-opened]))
   '()))
