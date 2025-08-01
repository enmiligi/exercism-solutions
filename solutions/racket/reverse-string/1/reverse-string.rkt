#lang racket
(provide my-reverse)

(define (my-reverse-list l acc)
  (match l
    [(cons head tail) (my-reverse-list tail (cons head acc))]
    [_ acc]))

(define (my-reverse s)
  (list->string (my-reverse-list (string->list s) '())))
