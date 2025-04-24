using System;
using System.Linq;

class Arrays
{
    static void Main()
    {
        int[] scores = { 72, 45, 88, 91, 60, 77, 88, 53 };

        Console.WriteLine($"n = {scores.Length}, first = {scores[0]}, last = {scores[scores.Length - 1]}");

        int min = scores[0], max = scores[0], sum = 0;
        foreach (int s in scores)
        {
            if (s < min) min = s;
            if (s > max) max = s;
            sum += s;
        }
        Console.WriteLine($"min {min}, max {max}, sum {sum}, mean {(double)sum / scores.Length:F2}");
        Console.WriteLine($"with linq: {scores.Min()} {scores.Max()} {scores.Average():F2}");

        int[] copy = new int[scores.Length];
        Array.Copy(scores, copy, scores.Length);
        Array.Sort(copy);
        Console.WriteLine("sorted:   " + string.Join(", ", copy));
        Array.Reverse(copy);
        Console.WriteLine("reversed: " + string.Join(", ", copy));
        Console.WriteLine("original: " + string.Join(", ", scores));

        Console.WriteLine($"contains 91? {Array.IndexOf(scores, 91) >= 0}");
        Console.WriteLine($"contains 100? {scores.Contains(100)}");

        int[] sorted = (int[])scores.Clone();
        Array.Sort(sorted);
        int n = sorted.Length;
        double median = n % 2 == 1 ? sorted[n / 2] : (sorted[n / 2 - 1] + sorted[n / 2]) / 2.0;
        Console.WriteLine($"median {median}");

        double mean = scores.Average();
        double ss = 0;
        foreach (int s in scores) ss += (s - mean) * (s - mean);
        Console.WriteLine($"sample sd {Math.Sqrt(ss / (n - 1)):F2}");

        Random rnd = new Random();
        int[] values = new int[100];
        for (int i = 0; i < values.Length; i++)
            values[i] = rnd.Next(1, 1000);
        Console.WriteLine($"random array: min {values.Min()}, max {values.Max()}");

        var repeated = scores.GroupBy(v => v).Where(g => g.Count() > 1).Select(g => g.Key);
        Console.WriteLine("repeated: " + string.Join(", ", repeated));
    }
}
