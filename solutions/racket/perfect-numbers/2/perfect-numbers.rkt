#lang racket

(provide classify)

(define (classify number)
  (let* ([aliquot-sum (for/sum ([n (in-range 1 number)] #:when (zero? (modulo number n))) n)])
    (cond
      [(= aliquot-sum number) 'perfect]
      [(< aliquot-sum number) 'deficient]
      [else 'abundant])))
