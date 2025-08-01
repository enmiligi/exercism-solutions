#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(define robot-name-cache (mutable-set))

(define (random-uppercase)
  (integer->char (+ (random 0 26) (char->integer #\A))))

(define (gen-robot-name)
  (let ([name (format "~a~a~a" (random-uppercase) (random-uppercase) (random 100 1001))])
    (if (set-member? robot-name-cache name)
        (gen-robot-name)
        (begin
          (set-add! robot-name-cache name)
          name))))

(define (make-robot)
  (box (gen-robot-name)))

(define (name robot)
  (unbox robot))

(define (reset! robot)
  (set-remove! robot-name-cache (unbox robot))
  (set-box! robot (gen-robot-name)))

(define (reset-name-cache!)
  (set! robot-name-cache (mutable-set)))
