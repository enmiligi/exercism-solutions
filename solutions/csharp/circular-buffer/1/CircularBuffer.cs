using System;

public class CircularBuffer<T>
{
    private T[] values;
    private bool[] hasValue;
    private readonly int capacity;
    private int position = 0;
    private int oldest = 0;

    public CircularBuffer(int capacity)
    {
        this.capacity = capacity;
        values = new T[capacity];
        hasValue = new bool[capacity];
    }

    public T Read()
    {
        if (hasValue[oldest])
        {
            hasValue[oldest] = false;
            T value = values[oldest];
            oldest = (oldest + 1) % capacity;
            return value;
        }
        else
        {
            throw new InvalidOperationException($"{oldest}");
        }
    }

    public void Write(T value)
    {
        if (!hasValue[position])
        {
            values[position] = value;
            hasValue[position] = true;
            position = (position + 1) % capacity;
        }
        else
        {
            throw new InvalidOperationException();
        }
    }

    public void Overwrite(T value)
    {
        if (oldest == position)
        {
            oldest = (oldest + 1) % capacity;
        }
        values[position] = value;
        hasValue[position] = true;
        position = (position + 1) % capacity;
    }

    public void Clear() => hasValue = new bool[capacity];
}