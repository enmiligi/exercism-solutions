using System;
using System.Text;
using System.Text.RegularExpressions;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        StringBuilder stringBuild = new StringBuilder();
        bool kebab = false;
        for (int i = 0; i < identifier.Length; i++)
        {
            stringBuild.Append(identifier[i] switch
            {
                ' ' => '_',
                _ when identifier[i] >= 'α' && identifier[i] <= 'ω'
                    => "",
                _ when char.IsControl(identifier[i]) => "CTRL",
                _ when kebab && char.IsLetter(identifier[i]) =>
                    char.ToUpper(identifier[i]),
                _ when char.IsLetter(identifier[i]) =>
                    identifier[i],
                _ => ""
            });
            kebab = identifier[i] == '-';
        }
        return stringBuild.ToString();
    }
}
