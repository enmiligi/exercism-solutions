
using System.Collections.Generic;

using Microsoft.VisualStudio.TestPlatform.ObjectModel.Client;

public static class ProteinTranslation
{

    public static string[] Proteins(string strand)
    {
        List<string> result = new List<string>(strand.Length / 3);
        bool stop = false;
        for (int i = 0; i < strand.Length && !stop; i += 3)
        {
            switch (strand.Substring(i, 3))
            {
                case "AUG":
                    result.Add("Methionine");
                    break;
                case "UUU":
                case "UUC":
                    result.Add("Phenylalanine");
                    break;
                case "UUA":
                case "UUG":
                    result.Add("Leucine");
                    break;
                case "UCU":
                case "UCC":
                case "UCA":
                case "UCG":
                    result.Add("Serine");
                    break;
                case "UAU":
                case "UAC":
                    result.Add("Tyrosine");
                    break;
                case "UGU":
                case "UGC":
                    result.Add("Cysteine");
                    break;
                case "UGG":
                    result.Add("Tryptophan");
                    break;
                case "UAA":
                case "UAG":
                case "UGA":
                    stop = true;
                    break;
                default:
                    break;
            }
        }
        return result.ToArray();
    }
}