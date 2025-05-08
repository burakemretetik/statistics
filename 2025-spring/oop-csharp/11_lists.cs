using System;
using System.Collections.Generic;
using System.Linq;

class Lists
{
    static void Main()
    {
        List<int> numbers = new List<int> { 14, 3, 27, 8 };
        numbers.Add(19);
        numbers.AddRange(new[] { 6, 42, 11 });
        numbers.Insert(0, 100);
        Console.WriteLine(string.Join(", ", numbers));

        numbers.RemoveAt(0);
        numbers.Remove(27);
        Console.WriteLine($"{string.Join(", ", numbers)} (count {numbers.Count})");

        Console.WriteLine($"contains 8? {numbers.Contains(8)}, index of 42: {numbers.IndexOf(42)}");

        numbers.Sort();
        Console.WriteLine("sorted: " + string.Join(", ", numbers));
        numbers.Reverse();
        Console.WriteLine("reversed: " + string.Join(", ", numbers));

        int firstBig = numbers.Find(x => x > 10);
        List<int> evens = numbers.FindAll(x => x % 2 == 0);
        var bigEvens = numbers.Where(x => x > 10 && x % 2 == 0).ToList();
        Console.WriteLine($"first > 10: {firstBig}");
        Console.WriteLine("evens: " + string.Join(", ", evens));
        Console.WriteLine("even and > 10: " + string.Join(", ", bigEvens));

        int[] arr = numbers.ToArray();
        List<int> back = new List<int>(arr);
        Console.WriteLine($"{arr.Length} {back.Count}");

        for (int i = 0; i < numbers.Count; i++)
            Console.WriteLine($"{i + 1}. {numbers[i]}");

        Random rnd = new Random();
        var shuffled = numbers.OrderBy(x => rnd.Next()).ToList();
        Console.WriteLine("shuffled: " + string.Join(", ", shuffled));

        List<string> words = new List<string> { "variance", "mean", "mode", "regression", "median" };
        Console.WriteLine(string.Join(", ", words.OrderBy(w => w.Length)));
        Console.WriteLine(string.Join(", ", words.Where(w => w.Length > 5)));

        Dictionary<string, int> grades = new Dictionary<string, int>
        {
            { "Ali", 80 },
            { "Ayse", 90 },
            { "Mehmet", 65 }
        };
        grades["Zeynep"] = 72;
        foreach (var pair in grades.OrderByDescending(p => p.Value))
            Console.WriteLine($"{pair.Key,-8}{pair.Value}");

        numbers.Clear();
        Console.WriteLine($"after clear: {numbers.Count}");
    }
}
