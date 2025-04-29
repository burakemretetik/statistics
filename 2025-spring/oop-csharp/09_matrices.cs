using System;

class Matrices
{
    static void Print(int[,] m)
    {
        for (int i = 0; i < m.GetLength(0); i++)
        {
            for (int j = 0; j < m.GetLength(1); j++)
                Console.Write($"{m[i, j],5}");
            Console.WriteLine();
        }
        Console.WriteLine();
    }

    static int[,] Multiply(int[,] a, int[,] b)
    {
        int rows = a.GetLength(0), cols = b.GetLength(1), inner = a.GetLength(1);
        int[,] c = new int[rows, cols];
        for (int i = 0; i < rows; i++)
            for (int j = 0; j < cols; j++)
                for (int k = 0; k < inner; k++)
                    c[i, j] += a[i, k] * b[k, j];
        return c;
    }

    static void Main()
    {
        int[,] a =
        {
            { 2, 1, 4 },
            { 1, 5, 3 },
            { 4, 3, 9 }
        };
        int[,] b =
        {
            { 1, 0, 2 },
            { 3, 1, 0 },
            { 0, 2, 1 }
        };

        int n = a.GetLength(0);
        Console.WriteLine($"{a.GetLength(0)}x{a.GetLength(1)}, {a.Length} elements");

        int total = 0, diag = 0, antiDiag = 0;
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
            {
                total += a[i, j];
                if (i == j) diag += a[i, j];
                if (i + j == n - 1) antiDiag += a[i, j];
            }
        Console.WriteLine($"sum {total}, trace {diag}, anti-diagonal {antiDiag}");

        int[,] t = new int[n, n];
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                t[j, i] = a[i, j];
        Console.WriteLine("transpose:");
        Print(t);

        bool symmetric = true;
        for (int i = 0; i < n && symmetric; i++)
            for (int j = 0; j < n; j++)
                if (a[i, j] != a[j, i]) { symmetric = false; break; }
        Console.WriteLine($"symmetric: {symmetric}");

        int[,] sum = new int[n, n];
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                sum[i, j] = a[i, j] + b[i, j];
        Console.WriteLine("A + B:");
        Print(sum);

        Console.WriteLine("A x B:");
        Print(Multiply(a, b));

        int[][] jagged = new int[3][];
        jagged[0] = new[] { 1 };
        jagged[1] = new[] { 1, 1 };
        jagged[2] = new[] { 1, 2, 1 };
        foreach (int[] row in jagged)
            Console.WriteLine(string.Join(" ", row));
    }
}
