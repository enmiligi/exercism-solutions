(import (rnrs))
(use-modules (srfi srfi-13))

(define letters-and-score
  (list (cons "aeioulnrst" 1)
        (cons "dg" 2)
        (cons "bcmp" 3)
        (cons "fhvwy" 4)
        (cons "k" 5)
        (cons "jx" 8)
        (cons "qz" 10)))

(define (score-for-letter letter)
  (letrec ((upcase-letter (integer->char (logior (char->integer letter) 32)))
           (go (lambda (l-and-s)
                 (if (null? l-and-s)
                     0
                     (if (member upcase-letter (string->list (caar l-and-s)))
                         (cdar l-and-s)
                         (go (cdr l-and-s)))))))
    (go letters-and-score)))

(define (score word)
  (apply + (map score-for-letter (string->list word)))
  )

