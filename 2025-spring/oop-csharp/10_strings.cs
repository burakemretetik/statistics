using System;
using System.Linq;

class Strings
{
    static bool IsPalindrome(string s)
    {
        string clean = new string(s.ToLower().Where(char.IsLetter).ToArray());
        for (int i = 0, j = clean.Length - 1; i < j; i++, j--)
            if (clean[i] != clean[j]) return false;
        return true;
    }

    static void Main()
    {
        string s = "   Descriptive Statistics and Data Analysis   ";

        Console.WriteLine($"[{s}] {s.Length}");
        s = s.Trim();
        Console.WriteLine($"[{s}] {s.Length}");
        Console.WriteLine(s.ToUpper());
        Console.WriteLine(s.ToLower());

        Console.WriteLine(s.Contains("Data"));
        Console.WriteLine(s.StartsWith("Desc"));
        Console.WriteLine(s.EndsWith("analysis"));
        Console.WriteLine(s.EndsWith("analysis", StringComparison.OrdinalIgnoreCase));

        Console.WriteLine($"{s[0]} {s[s.Length - 1]}");
        Console.WriteLine(s.Substring(12, 10));
        Console.WriteLine($"first 'a' at {s.IndexOf('a')}, last at {s.LastIndexOf('a')}");
        Console.WriteLine(s.Replace(" ", "_"));

        string[] words = s.Split(' ');
        Console.WriteLine($"{words.Length} words");
        Console.WriteLine(string.Join(" | ", words));
        Console.WriteLine("longest: " + words.OrderByDescending(w => w.Length).First());

        char[] chars = s.ToCharArray();
        Array.Reverse(chars);
        Console.WriteLine(new string(chars));

        int vowels = s.Count(ch => "aeiouAEIOU".IndexOf(ch) >= 0);
        Console.WriteLine($"vowels: {vowels}");

        string name = "Burak";
        double gpa = 3.4567;
        Console.WriteLine(string.Format("{0} has a GPA of {1:F2}", name, gpa));
        Console.WriteLine($"{name} has a GPA of {gpa:F2}");

        string empty = "   ";
        Console.WriteLine($"{string.IsNullOrEmpty(empty)} {string.IsNullOrWhiteSpace(empty)}");

        foreach (string w in new[] { "level", "Never odd or even", "statistics" })
            Console.WriteLine($"{w}: {IsPalindrome(w)}");

        string csv = "12;7;19;3;25";
        int total = csv.Split(';').Select(int.Parse).Sum();
        Console.WriteLine($"sum of {csv} = {total}");
    }
}
