#lang racket

(provide classify)

(define (classify number)
  (let* ([factors (filter (lambda [n] (zero? (modulo number n))) (range 1 number))]
         [aliquot-sum (apply + factors)])
    (cond
      [(= aliquot-sum number) 'perfect]
      [(< aliquot-sum number) 'deficient]
      [else 'abundant])))
