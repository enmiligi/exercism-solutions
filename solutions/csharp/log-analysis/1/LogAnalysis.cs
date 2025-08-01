using System;

public static class LogAnalysis
{
    public static string SubstringAfter(this string str, string delimiter)
    {
        return str.Substring(str.IndexOf(delimiter) + delimiter.Length);
    }

    public static string SubstringBetween(this string str, string start, string end)
    {
        int startIndex = str.IndexOf(start) + start.Length;
        int endIndex = str.IndexOf(end) - startIndex;
        return str.Substring(startIndex, endIndex);
    }

    public static string Message(this string str)
    {
        return str.SubstringAfter(": ");
    }

    public static string LogLevel(this string str)
    {
        return str.SubstringBetween("[", "]");
    }
}