#lang racket

(provide binary-search)

(define (binary-search-helper search-vector start-window end-window value)
  (let* ([middle-window (quotient (+ start-window end-window) 2)]
         [current-value (vector-ref search-vector middle-window)])
    (cond
      [(= current-value value) middle-window]
      [(>= start-window end-window) (error "Not found!")]
      [(< value current-value) (binary-search-helper search-vector start-window (sub1 middle-window) value)]
      [else (binary-search-helper search-vector (add1 middle-window) end-window value)])))

(define (binary-search array value)
  (let* ([search-vector (list->vector array)]
         [start-window 0]
         [end-window (- (vector-length search-vector) 1)])
    (binary-search-helper search-vector start-window end-window value)))
