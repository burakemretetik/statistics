using System;

class TypeConversion
{
    static void Main()
    {
        int a = 7;
        long big = a;
        double x = a;
        Console.WriteLine($"{big} {x}");

        double score = 87.9;
        int truncated = (int)score;
        int rounded = Convert.ToInt32(score);
        Console.WriteLine($"cast: {truncated}, Convert: {rounded}");

        int total = 17, count = 4;
        Console.WriteLine(total / count);
        Console.WriteLine((double)total / count);

        string s = "42";
        int n1 = int.Parse(s);
        int n2 = Convert.ToInt32(s);
        Console.WriteLine(n1 + n2);
        Console.WriteLine(s + s);

        string[] inputs = { "12", "3.7", "abc", "" };
        foreach (string input in inputs)
        {
            if (int.TryParse(input, out int value))
                Console.WriteLine($"'{input}' -> {value}");
            else
                Console.WriteLine($"'{input}' is not an int");
        }

        char letter = 'a';
        Console.WriteLine((int)letter);
        Console.WriteLine((char)(letter + 1));

        int max = int.MaxValue;
        unchecked
        {
            Console.WriteLine(max + 1);
        }
        try
        {
            checked
            {
                int overflow = max + 1;
                Console.WriteLine(overflow);
            }
        }
        catch (OverflowException)
        {
            Console.WriteLine("overflow caught");
        }
    }
}
