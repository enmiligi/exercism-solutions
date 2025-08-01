using System;
using System.Text;
using System.Linq;

public class SimpleCipher
{
    private Random getRandom = new();

    public SimpleCipher() =>
        Key = Enumerable.Range(0, 100)
                    .Select(_ => (char)getRandom.Next('a', 'z' + 1))
                    .Aggregate(new StringBuilder(), (strB, c) => strB.Append(c))
                    .ToString();

    public SimpleCipher(string key)
    {
        Key = key;
    }

    public string Key { get; }

    private char shift(char c, int amount)
    {
        char result = (char)(c + amount);
        if (result < 'a') result = (char)(result + 26);
        if (result > 'z') result = (char)(result - 26);
        return result;
    }

    public string Encode(string plaintext) =>
        plaintext.Select((c, i) => shift(c, Key[i % Key.Length] - 'a'))
        .Aggregate(new StringBuilder(), (strB, c) => strB.Append(c))
        .ToString();

    public string Decode(string ciphertext) =>
        ciphertext.Select((c, i) => shift(c, 'a' - Key[i % Key.Length]))
        .Aggregate(new StringBuilder(), (strB, c) => strB.Append(c))
        .ToString();
}