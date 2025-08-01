#lang racket

(provide square total)

(define (square num-square)
  (expt 2 (- num-square 1)))

(define (total)
  (- (expt 2 64) 1))