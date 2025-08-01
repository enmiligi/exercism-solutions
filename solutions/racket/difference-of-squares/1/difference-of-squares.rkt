#lang racket

(provide sum-of-squares
         square-of-sum
         difference)

(define (sum-of-squares number)
  (apply + (map sqr (inclusive-range 1 number))))

(define (square-of-sum number)
  (sqr (foldl + 0 (inclusive-range 1 number))))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))
