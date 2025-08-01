using System;
using System.Text;

public class SimpleCipher
{
    private Random getRandom = new();

    public SimpleCipher()
    {
        StringBuilder stringBuilder = new();
        for (int i = 0; i < 100; i++)
        {
            int randint = getRandom.Next(0, 26);
            char c = (char)('a' + randint);
            stringBuilder.Append(c);
        }
        Key = stringBuilder.ToString();
    }

    public SimpleCipher(string key)
    {
        Key = key;
    }

    public string Key { get; }

    public string Encode(string plaintext)
    {
        StringBuilder strBuild = new();
        for (int i = 0; i < plaintext.Length; i++)
        {
            int shift = Key[i % Key.Length] - 'a';
            char c = (char)(plaintext[i] + shift);
            if (c > 'z')
            {
                c = (char)(c - 26);
            }
            strBuild.Append(c);
        }
        return strBuild.ToString();
    }

    public string Decode(string ciphertext)
    {
        StringBuilder strBuild = new();
        for (int i = 0; i < ciphertext.Length; i++)
        {
            int shift = 'a' - Key[i % Key.Length];
            char c = (char)(ciphertext[i] + shift);
            if (c < 'a')
            {
                c = (char)(c + 26);
            }
            strBuild.Append(c);
        }
        return strBuild.ToString();
    }
}