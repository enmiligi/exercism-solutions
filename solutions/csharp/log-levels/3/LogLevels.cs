using System;

static class LogLine
{
    public static string Message(string logLine)
    {
        return logLine.Substring(logLine.IndexOf(":") + 1).Trim();
    }

    public static string LogLevel(string logLine)
    {
        int start = logLine.IndexOf("[");
        int end = logLine.IndexOf("]");
        return logLine
                .Substring(
                    start + 1,
                    end - (start + 1))
                .ToLower();
    }

    public static string Reformat(string logLine)
    {
        return $"{Message(logLine)} ({LogLevel(logLine)})";
    }
}
