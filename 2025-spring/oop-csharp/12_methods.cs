using System;

class Methods
{
    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int d = 2; d * d <= n; d++)
            if (n % d == 0) return false;
        return true;
    }

    static double Average(double a, double b) => (a + b) / 2;

    static double Average(params double[] values)
    {
        double sum = 0;
        foreach (double v in values) sum += v;
        return sum / values.Length;
    }

    static string Reverse(string text)
    {
        char[] chars = text.ToCharArray();
        Array.Reverse(chars);
        return new string(chars);
    }

    static double Calculate(double a, double b, char op)
    {
        switch (op)
        {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/':
                if (b == 0) throw new DivideByZeroException();
                return a / b;
            default: throw new ArgumentException("unknown operator " + op);
        }
    }

    static bool IsEven(int n) => n % 2 == 0;

    static void SortThree(ref int a, ref int b, ref int c)
    {
        if (a > b) Swap(ref a, ref b);
        if (b > c) Swap(ref b, ref c);
        if (a > b) Swap(ref a, ref b);
    }

    static void Swap(ref int x, ref int y)
    {
        int t = x;
        x = y;
        y = t;
    }

    static int WordCount(string sentence) =>
        sentence.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries).Length;

    static string GradeStatus(double midterm, double final)
    {
        double avg = midterm * 0.4 + final * 0.6;
        return avg >= 60 ? $"passed ({avg:F1})" : $"failed ({avg:F1})";
    }

    static int Max(int[] arr)
    {
        int max = arr[0];
        foreach (int x in arr) if (x > max) max = x;
        return max;
    }

    static int DigitSum(int n)
    {
        n = Math.Abs(n);
        int sum = 0;
        while (n > 0)
        {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }

    static void MinMax(int[] arr, out int min, out int max)
    {
        min = max = arr[0];
        foreach (int x in arr)
        {
            if (x < min) min = x;
            if (x > max) max = x;
        }
    }

    static long Factorial(int n) => n <= 1 ? 1 : n * Factorial(n - 1);

    static void Main()
    {
        Console.Write("Enter a number: ");
        int n = int.Parse(Console.ReadLine());
        Console.WriteLine($"{n} is {(IsPrime(n) ? "prime" : "not prime")} and {(IsEven(n) ? "even" : "odd")}");
        Console.WriteLine($"digit sum: {DigitSum(n)}");

        Console.WriteLine(Average(4.5, 7));
        Console.WriteLine(Average(3, 8, 10, 11));
        Console.WriteLine(Reverse("statistics"));

        foreach (char op in "+-*/")
            Console.WriteLine($"12 {op} 4 = {Calculate(12, 4, op)}");

        int a = 9, b = 2, c = 5;
        SortThree(ref a, ref b, ref c);
        Console.WriteLine($"{a} {b} {c}");

        Console.WriteLine(WordCount("  the  quick brown fox "));
        Console.WriteLine(GradeStatus(45, 70));
        Console.WriteLine(GradeStatus(40, 50));

        int[] data = { 4, 19, -3, 12, 7 };
        Console.WriteLine($"max: {Max(data)}");
        MinMax(data, out int lo, out int hi);
        Console.WriteLine($"range: {lo}..{hi}");

        for (int i = 0; i <= 10; i += 5)
            Console.WriteLine($"{i}! = {Factorial(i)}");
    }
}
