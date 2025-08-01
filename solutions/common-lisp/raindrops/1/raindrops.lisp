(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (let ((sound
         (concatenate 'string
           (if (zerop (mod n 3)) "Pling" "")
           (if (zerop (mod n 5)) "Plang" "")
           (if (zerop (mod n 7)) "Plong" ""))))
       (if (equal sound "")
           (write-to-string n)
           sound)))
