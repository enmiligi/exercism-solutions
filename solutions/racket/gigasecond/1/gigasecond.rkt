#lang racket

(require racket/date)

(provide add-gigasecond)

(define (add-gigasecond datetime)
  (seconds->date (+ (date->seconds datetime) 1000000000)))
