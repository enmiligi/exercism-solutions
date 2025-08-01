using System;

public class Clock : IEquatable<Clock>
{
    private int hours;
    private int minutes;

    public Clock(int hours, int minutes)
    {
        this.hours = (int)((hours + (minutes / 60.0)) % 24 + 24) % 24;
        this.minutes = (minutes % 60 + 60) % 60;
    }

    public override string ToString() =>
        String.Format("{0:D2}:{1:D2}", hours, minutes);

    public Clock Add(int minutesToAdd)
    {
        return new Clock(hours, minutes + minutesToAdd);
    }

    public Clock Subtract(int minutesToSubtract)
    {
        return new Clock(hours, minutes - minutesToSubtract);
    }

    public bool Equals(Clock other)
    {
        return hours == other.hours && minutes == other.minutes;
    }
}
