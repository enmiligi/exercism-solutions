
using System;
using System.Collections.Generic;

public static class ProteinTranslation
{

    public static string[] Proteins(string strand)
    {
        List<string> result = new List<string>(strand.Length / 3);
        for (int i = 0; i < strand.Length; i += 3)
        {
            string translated = strand.Substring(i, 3) switch
            {
                "AUG" => "Methionine",
                "UGG" => "Tryptophan",
                "UUU" or "UUC" => "Phenylalanine",
                "UUA" or "UUG" => "Leucine",
                "UAU" or "UAC" => "Tyrosine",
                "UGU" or "UGC" => "Cysteine",
                "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
                "UAA" or "UAG" or "UGA" => "STOP",
                _ => throw new Exception("Invalid sequence")
            };
            if (translated == "STOP") break;
            result.Add(translated);
        }
        return result.ToArray();
    }
}