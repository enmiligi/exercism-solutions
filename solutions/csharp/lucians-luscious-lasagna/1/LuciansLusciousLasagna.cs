class Lasagna
{
    public int ExpectedMinutesInOven()
    {
        return 40;
    }

    public int RemainingMinutesInOven(int minutes)
    {
        return 40 - minutes;
    }

    public int PreparationTimeInMinutes(int layers)
    {
        return layers * 2;
    }

    public int ElapsedTimeInMinutes(int layers, int minutes)
    {
        return PreparationTimeInMinutes(layers) + minutes;
    }
}
