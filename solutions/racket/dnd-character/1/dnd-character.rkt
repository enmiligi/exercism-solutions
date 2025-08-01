#lang racket

(provide (struct-out character)
         ability
         make-character
         modifier)

(struct character
    (hitpoints strength dexterity constitution intelligence wisdom charisma))

(define (throw-die)
  (random 1 7))

(define (ability)
  (apply + (take (sort (map (lambda (_) (throw-die)) (range 4)) >) 3)))

(define (modifier value)
  (floor (/ (- value 10) 2)))

(define (make-character)
  (let* ([strength (ability)]
         [dexterity (ability)]
         [constitution (ability)]
         [intelligence (ability)]
         [wisdom (ability)]
         [charisma (ability)]
         [hitpoints (+ 10 (modifier constitution))])
    (character strength
               dexterity
               constitution
               intelligence
               wisdom
               charisma
               hitpoints)))
