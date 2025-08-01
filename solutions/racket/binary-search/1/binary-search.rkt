#lang racket

(provide binary-search)

(define (binary-search-helper search-vector start-window end-window value)
  (do ([start-window
        start-window
        (if (> value (vector-ref search-vector middle-window))
            (+ middle-window 1)
            start-window)]
       [end-window
        end-window
        (if (< value (vector-ref search-vector middle-window))
            (- middle-window 1)
            end-window)]
       [middle-window
        (floor (/ (+ start-window end-window) 2))
        (floor (/ (+ start-window end-window) 2))])
       
      ((= (vector-ref search-vector middle-window) value) middle-window)
    (when (and
           (= start-window end-window)
           (not (= (vector-ref search-vector start-window) value)))
        (error start-window))))
   

(define (binary-search array value)
  (let* ([search-vector (list->vector array)]
         [start-window 0]
         [end-window (vector-length search-vector)])
    (binary-search-helper search-vector start-window end-window value)))
