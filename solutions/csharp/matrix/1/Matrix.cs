using System;

public class Matrix
{
    int[][] matrix;
    public Matrix(string input)
    {
        string[] rows = input.Split("\n");
        int numColumns = rows[0].Split(" ").Length;
        matrix = new int[rows.Length][];
        for (int i = 0; i < rows.Length; i++)
        {
            string[] columns = rows[i].Split(" ");
            matrix[i] = new int[numColumns];
            for (int j = 0; j < numColumns; j++)
            {
                matrix[i][j] = int.Parse(columns[j]);
            }
        }
    }

    public int[] Row(int row)
    {
        row--;
        return matrix[row];
    }

    public int[] Column(int col)
    {
        col--;
        int[] column = new int[matrix.Length];
        for (int i = 0; i < matrix.Length; i++)
        {
            column[i] = matrix[i][col];
        }
        return column;
    }
}