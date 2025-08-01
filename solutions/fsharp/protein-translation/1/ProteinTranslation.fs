module ProteinTranslation


let toNucleotide codon =
    match codon with
    | "AUG" -> "Methionine"
    | "UUU"
    | "UUC" -> "Phenylalanine"
    | "UUA"
    | "UUG" -> "Leucine"
    | "UCU"
    | "UCC"
    | "UCA"
    | "UCG" -> "Serine"
    | "UAU"
    | "UAC" -> "Tyrosine"
    | "UGU"
    | "UGC" -> "Cysteine"
    | "UGG" -> "Tryptophan"
    | "UAA"
    | "UAG"
    | "UGA" -> "STOP"
    | _ -> ""


let proteins rna =
    rna
    |> Seq.chunkBySize 3
    |> Seq.map (fun lc -> new string (lc))
    |> Seq.map toNucleotide
    |> Seq.takeWhile (fun s -> s <> "STOP")
    |> Seq.toList
