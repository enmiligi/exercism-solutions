(ns rna-transcription)

(def transcribe-nucleotide
  {\G \C,
   \C \G,
   \T \A,
   \A \U})

(defn to-rna [dna]
  (assert (every? transcribe-nucleotide dna))
  (apply str (map transcribe-nucleotide dna)))
