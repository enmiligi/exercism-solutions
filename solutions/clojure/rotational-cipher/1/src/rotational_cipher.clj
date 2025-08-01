(ns rotational-cipher
  (:import java.lang.Character))

(defn rotate-char [key character]
  (if (Character/isLetter character)
    (let [rotated-char-code
          (+ (int character) key)
          upper-bound
          (if (Character/isLowerCase character)
            (int \z)
            (int \Z))]
      (char (if (> rotated-char-code upper-bound)
              (- rotated-char-code 26)
              rotated-char-code)))
    character))

(defn rotate [sentence key]
  (let [key (mod key 26)]
    (apply str (map (partial rotate-char key) sentence))))
