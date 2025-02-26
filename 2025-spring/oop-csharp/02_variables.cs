using System;

class Variables
{
    const double Pi = 3.14159;

    static void Main()
    {
        byte b = 255;
        short s = -32768;
        int i = int.MaxValue;
        long l = long.MaxValue;
        float f = 3.5f;
        double d = 2.0 / 3;
        decimal m = 0.1m + 0.2m;
        char c = 'A';
        bool ok = true;
        string text = "statistics";

        Console.WriteLine($"byte    {b}");
        Console.WriteLine($"short   {s}");
        Console.WriteLine($"int     {i}  ({int.MinValue} .. {int.MaxValue})");
        Console.WriteLine($"long    {l}");
        Console.WriteLine($"float   {f}");
        Console.WriteLine($"double  {d}");
        Console.WriteLine($"decimal {m}");
        Console.WriteLine($"char    {c} -> {(int)c}");
        Console.WriteLine($"bool    {ok}");
        Console.WriteLine($"string  {text} ({text.Length} chars)");

        // double can't hold 0.1 exactly, decimal can
        Console.WriteLine(0.1 + 0.2 == 0.3);
        Console.WriteLine(0.1m + 0.2m == 0.3m);

        double r = 4;
        Console.WriteLine($"area of circle with r={r}: {Pi * r * r}");

        var n = 10;
        Console.WriteLine(n.GetType());
    }
}
