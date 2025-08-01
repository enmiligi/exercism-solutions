(ns nucleotide-count)

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (if (#{\A, \C, \G, \T} nucleotide)
    (count (filter (partial = nucleotide) strand))
    (throw (IllegalArgumentException. "Nucleotide not valid"))))

(defn nucleotide-counts [strand]
  (if (not-every? #{\A, \C, \G, \T} strand)
    (throw (IllegalArgumentException. "Invalid Nucleotide"))
    {\A (count-of-nucleotide-in-strand \A strand)
     \C (count-of-nucleotide-in-strand \C strand)
     \G (count-of-nucleotide-in-strand \G strand)
     \T (count-of-nucleotide-in-strand \T strand)}))
