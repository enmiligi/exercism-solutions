using System;
using System.Collections;
using System.Collections.Generic;
#nullable enable

public class BinarySearchTree : IEnumerable<int>
{
    public BinarySearchTree(int value)
    {
        Value = value;
    }

    public BinarySearchTree(IEnumerable<int> values)
    {
        bool first = true;
        foreach (var value in values)
        {
            if (first)
            {
                Value = value;
                first = false;
            }
            else
            {
                Add(value);
            }
        }
        if (first)
        {
            throw new ArgumentException();
        }
    }

    public int Value;

    public BinarySearchTree? Left = null;

    public BinarySearchTree? Right = null;

    public BinarySearchTree Add(int value)
    {
        if (value <= Value)
        {
            if (Left == null)
            {
                Left = new BinarySearchTree(value);
            }
            else
            {
                Left.Add(value);
            }
        }
        else
        {
            if (Right == null)
            {
                Right = new BinarySearchTree(value);
            }
            else
            {
                Right.Add(value);
            }
        }
        return this;
    }

    public IEnumerator<int> GetEnumerator()
    {
        if (Left != null)
        {
            foreach (var num in Left)
            {
                yield return num;
            }
        }

        yield return Value;

        if (Right != null)
        {
            foreach (var num in Right)
            {
                yield return num;
            }
        }
    }

    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}