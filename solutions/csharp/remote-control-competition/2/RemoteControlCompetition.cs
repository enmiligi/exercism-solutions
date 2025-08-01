using System;
using System.Collections.Generic;

public interface IRemoteControlCar
{
    void Drive();
    int DistanceTravelled { get; }
}

public class ProductionRemoteControlCar : IRemoteControlCar, IComparable<ProductionRemoteControlCar>
{
    public int DistanceTravelled { get; private set; }
    public int NumberOfVictories { get; set; }

    public int CompareTo(ProductionRemoteControlCar other) =>
        NumberOfVictories.CompareTo(other.NumberOfVictories);

    public void Drive() =>
        DistanceTravelled += 10;
}

public class ExperimentalRemoteControlCar : IRemoteControlCar
{
    public int DistanceTravelled { get; private set; }

    public void Drive() =>
        DistanceTravelled += 20;
}

public static class TestTrack
{
    public static void Race(IRemoteControlCar car) =>
        car.Drive();

    public static List<ProductionRemoteControlCar> GetRankedCars(ProductionRemoteControlCar prc1,
        ProductionRemoteControlCar prc2)
    {
        if (prc1.CompareTo(prc2) <= 0)
        {
            return new() { prc1, prc2 };
        }
        else
        {
            return new() { prc2, prc1 };
        }
    }
}
