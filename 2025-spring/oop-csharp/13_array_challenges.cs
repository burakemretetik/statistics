using System;
using System.Linq;

class ArrayChallenges
{
    static int[] LongestIncreasingRun(int[] a)
    {
        int bestStart = 0, bestLen = 1, start = 0;
        for (int i = 1; i < a.Length; i++)
        {
            if (a[i] <= a[i - 1]) start = i;
            if (i - start + 1 > bestLen)
            {
                bestLen = i - start + 1;
                bestStart = start;
            }
        }
        return a.Skip(bestStart).Take(bestLen).ToArray();
    }

    static int SecondLargest(int[] a)
    {
        int first = int.MinValue, second = int.MinValue;
        foreach (int x in a)
        {
            if (x > first) { second = first; first = x; }
            else if (x > second && x != first) second = x;
        }
        return second;
    }

    static int[] RotateLeft(int[] a, int k)
    {
        int n = a.Length;
        int[] r = new int[n];
        for (int i = 0; i < n; i++)
            r[i] = a[(i + k) % n];
        return r;
    }

    static void Main()
    {
        int[] a = { 5, 1, 3, 8, 9, 2, 4, 6, 7, 10, 3 };

        Console.WriteLine("longest increasing run: " + string.Join(" ", LongestIncreasingRun(a)));
        Console.WriteLine("second largest: " + SecondLargest(a));
        Console.WriteLine("rotated by 3: " + string.Join(" ", RotateLeft(a, 3)));

        int[] running = new int[a.Length];
        running[0] = a[0];
        for (int i = 1; i < a.Length; i++)
            running[i] = running[i - 1] + a[i];
        Console.WriteLine("cumulative: " + string.Join(" ", running));

        Random rnd = new Random(7);
        int[] rolls = new int[30];
        for (int i = 0; i < rolls.Length; i++) rolls[i] = rnd.Next(1, 7);
        Console.WriteLine("rolls: " + string.Join("", rolls));

        int[] freq = new int[7];
        foreach (int r in rolls) freq[r]++;
        for (int face = 1; face <= 6; face++)
            Console.WriteLine($"{face} {new string('*', freq[face])}");

        string asText = string.Concat(rolls.Take(5));
        Console.WriteLine($"first five as text: {asText}");

        string[] words = { "sample", "population", "estimator", "bias" };
        string longest = words[0];
        foreach (string w in words)
            if (w.Length > longest.Length) longest = w;
        Console.WriteLine($"longest word: {longest}");
    }
}
