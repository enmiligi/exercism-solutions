using System;
using System.Text;
using System.Text.RegularExpressions;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        string spaceToUnderscore = identifier.Replace(" ", "_");
        string controlCharToCTRL =
            Regex.Replace(spaceToUnderscore, @"\p{Cc}", "CTRL");
        StringBuilder kebabToCamel = new StringBuilder();
        bool kebab = false;
        for (int i = 0; i < controlCharToCTRL.Length; i++)
        {
            if (controlCharToCTRL[i] == '-')
            {
                kebab = true;
            }
            else if (kebab)
            {
                kebab = false;
                kebabToCamel.Append(
                    controlCharToCTRL[i].ToString().ToUpper()
                );
            }
            else
            {
                kebabToCamel.Append(controlCharToCTRL[i]);
            }
        }
        string onlyLetters = Regex.Replace(kebabToCamel.ToString(),
            @"[^_\p{L}]", "");
        string noAlphaToOmega = Regex.Replace(onlyLetters,
            @"[α-ω]",
            "");
        return noAlphaToOmega;
    }
}
