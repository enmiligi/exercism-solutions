module ProteinTranslation


let toProtein codon =
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
    | _ -> failwith "Invalid Codon!"


let proteins rna =
    rna
    |> Seq.chunkBySize 3
    |> Seq.map (System.String >> toProtein)
    |> Seq.takeWhile ((<>) "STOP")
    |> Seq.toList
