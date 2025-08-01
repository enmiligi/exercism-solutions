using System;

class WeighingMachine
{
    public WeighingMachine(int precision)
    {
        Precision = precision;
    }
    public int Precision { get; }

    private double weight;
    public double Weight
    {
        get { return weight; }
        set
        {
            if (value < 0)
            {
                throw new ArgumentOutOfRangeException();
            }
            else
            {
                weight = value;
            }
        }
    }

    public double TareAdjustment = 5;

    public string DisplayWeight
    {
        get
        {
            double finalWeight = Weight - TareAdjustment;
            return String.Format($"{{0:F{Precision}}} kg", finalWeight);
        }
    }
}
