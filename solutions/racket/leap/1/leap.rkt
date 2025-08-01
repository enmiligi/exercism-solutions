#lang racket

(provide leap-year?)

(define (leap-year? year)
  (define divisible-by-four (= (modulo year 4) 0))
  (define divisible-by-hundred (= (modulo year 100) 0))
  (define divisible-by-fourhundred (= (modulo year 400) 0))
  (or (and divisible-by-four (not divisible-by-hundred)) divisible-by-fourhundred))