using System.Linq;

public class Matrix
{
    private readonly int[][] matrix;
    public Matrix(string input) =>
        matrix = input.Split("\n")
                    .Select(row => row.Split(" ")
                                        .Select(int.Parse)
                                        .ToArray()).ToArray();

    public int[] Row(int row) => matrix[row - 1];

    public int[] Column(int col) =>
        matrix.Select(row => row[col - 1]).ToArray();
}