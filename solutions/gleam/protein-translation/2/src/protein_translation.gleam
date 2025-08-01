import gleam/list

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  do_proteins(rna, [])
}

pub fn do_proteins(rna: String, nucleotides: List(String)) {
  case rna {
    "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok(list.reverse(nucleotides))
    "" -> Ok(list.reverse(nucleotides))
    "AUG" <> rna -> do_proteins(rna, ["Methionine", ..nucleotides])
    "UUU" <> rna | "UUC" <> rna ->
      do_proteins(rna, ["Phenylalanine", ..nucleotides])
    "UUA" <> rna | "UUG" <> rna -> do_proteins(rna, ["Leucine", ..nucleotides])
    "UCU" <> rna | "UCC" <> rna | "UCA" <> rna | "UCG" <> rna ->
      do_proteins(rna, ["Serine", ..nucleotides])
    "UAU" <> rna | "UAC" <> rna -> do_proteins(rna, ["Tyrosine", ..nucleotides])
    "UGU" <> rna | "UGC" <> rna -> do_proteins(rna, ["Cysteine", ..nucleotides])
    "UGG" <> rna -> do_proteins(rna, ["Tryptophan", ..nucleotides])
    _ -> Error(Nil)
  }
}
