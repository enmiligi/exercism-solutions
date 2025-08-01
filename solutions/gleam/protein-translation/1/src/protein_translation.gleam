pub fn proteins(rna: String) -> Result(List(String), Nil) {
  case rna {
    "AUG" <> rna -> add_protein("Methionine", rna)
    "UUU" <> rna | "UUC" <> rna -> add_protein("Phenylalanine", rna)
    "UUA" <> rna | "UUG" <> rna -> add_protein("Leucine", rna)
    "UCU" <> rna | "UCC" <> rna | "UCA" <> rna | "UCG" <> rna ->
      add_protein("Serine", rna)
    "UAU" <> rna | "UAC" <> rna -> add_protein("Tyrosine", rna)
    "UGU" <> rna | "UGC" <> rna -> add_protein("Cysteine", rna)
    "UGG" <> rna -> add_protein("Tryptophan", rna)
    "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok([])
    "" -> Ok([])
    _ -> Error(Nil)
  }
}

fn add_protein(nucleotide: String, rna: String) {
  try nucleotides = proteins(rna)
  Ok([nucleotide, ..nucleotides])
}
