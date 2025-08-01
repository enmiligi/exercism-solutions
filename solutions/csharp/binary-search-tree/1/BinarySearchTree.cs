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

    private BinarySearchTree? Top = null;

    private bool Visited = false;

    public BinarySearchTree Add(int value)
    {
        if (value <= Value)
        {
            if (Left == null)
            {
                Left = new BinarySearchTree(value)
                {
                    Top = this
                };
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
                Right = new BinarySearchTree(value)
                {
                    Top = this
                };
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
        BinarySearchTree node = this;
        while (true)
        {
            if (node.Left != null && !node.Left.Visited)
            {
                node = node.Left;
            }
            else
            {
                if (!node.Visited)
                {
                    yield return node.Value;
                }
                if (node.Right != null && !node.Right.Visited)
                {
                    node = node.Right;
                }
                else
                {
                    node.Visited = true;
                    if (node.Top != null)
                    {
                        if (node.Top.Right == node)
                        {
                            node.Top.Visited = true;
                        }
                        node = node.Top;
                    }
                    else
                    {
                        yield break;
                    }
                }
            }
        }
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }
}