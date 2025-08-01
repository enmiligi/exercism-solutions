using System;

public static class CentralBank
{
    public static string DisplayDenomination(long @base, long multiplier)
    {
        try
        {
            return $"{checked(@base * multiplier)}";
        }
        catch (OverflowException)
        {
            return "*** Too Big ***";
        }
    }

    public static string DisplayGDP(float @base, float multiplier)
    {
        float GDP = @base * multiplier;
        if (GDP == float.PositiveInfinity)
        {
            return "*** Too Big ***";
        }
        else
        {
            return $"{GDP}";
        }
    }

    public static string DisplayChiefEconomistSalary(decimal salaryBase, decimal multiplier)
    {
        try
        {
            return $"{salaryBase * multiplier}";
        }
        catch (OverflowException)
        {
            return "*** Much Too Big ***";
        }
    }
}
