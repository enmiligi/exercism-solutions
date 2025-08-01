using System;
using System.Globalization;
using System.Runtime.InteropServices;


public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc) =>
        dtUtc.ToLocalTime();

    private static TimeZoneInfo GetTimeZone(Location location)
    {
        string timezoneid = "";
        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            timezoneid = location switch
            {
                Location.NewYork => "Eastern Standard Time",
                Location.London => "GMT Standard Time",
                Location.Paris => "W. Europe Standard Time",
                _ => default
            };
        }
        else if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX)
                || RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
        {
            timezoneid = location switch
            {
                Location.NewYork => "America/New_York",
                Location.London => "Europe/London",
                Location.Paris => "Europe/Paris",
                _ => default
            };
        }
        TimeZoneInfo timezone = TimeZoneInfo.FindSystemTimeZoneById(timezoneid);
        return timezone;
    }

    public static DateTime Schedule(string appointmentDateDescription, Location location)
    {
        TimeZoneInfo timeZone = GetTimeZone(location);
        DateTime localTime = DateTime.Parse(appointmentDateDescription);
        return TimeZoneInfo.ConvertTimeToUtc(localTime, timeZone);
    }

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
    {
        TimeSpan timeSpan = alertLevel switch
        {
            AlertLevel.Early => TimeSpan.FromDays(1),
            AlertLevel.Standard => TimeSpan.FromMinutes(105),
            AlertLevel.Late => TimeSpan.FromMinutes(30),
            _ => default
        };
        return appointment - timeSpan;
    }

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        var timeZone = GetTimeZone(location);
        return timeZone.IsDaylightSavingTime(dt) !=
                timeZone.IsDaylightSavingTime(dt - TimeSpan.FromDays(7));
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location)
    {
        try
        {
            string Culture = location switch
            {
                Location.NewYork => "en-US",
                Location.London => "en-GB",
                Location.Paris => "fr",
                _ => default
            };
            DateTime dateTime = DateTime.Parse(dtStr, new CultureInfo(Culture));
            return dateTime;
        }
        catch (FormatException)
        {
            return new DateTime(1, 1, 1);
        }
    }
}
