using System;

class Operators
{
    static void Main()
    {
        Console.WriteLine(2 + 3 * 7);
        Console.WriteLine((2 + 3) * 7);
        Console.WriteLine((2 + (9 + 2) * 5) * 2);

        int a = 17, b = 5;
        Console.WriteLine($"{a} / {b} = {a / b}, remainder {a % b}");

        int i = 5;
        Console.WriteLine(i++);
        Console.WriteLine(i);
        Console.WriteLine(++i);

        int sum = 10;
        sum += 5;
        sum *= 2;
        sum -= 4;
        sum /= 2;
        Console.WriteLine(sum);

        int x = 12;
        bool inRange = x > 10 && x < 20;
        bool evenOrNegative = x % 2 == 0 || x < 0;
        Console.WriteLine($"{inRange} {evenOrNegative} {!inRange}");

        Console.WriteLine(x % 2 == 0 ? "even" : "odd");

        int seconds = 7384;
        int h = seconds / 3600;
        int m = seconds % 3600 / 60;
        int sec = seconds % 60;
        Console.WriteLine($"{seconds}s = {h}h {m}m {sec}s");

        double weight = 72, height = 1.78;
        double bmi = weight / (height * height);
        Console.WriteLine($"BMI: {bmi:F1}");

        Console.WriteLine(6 & 3);
        Console.WriteLine(6 | 3);
        Console.WriteLine(1 << 4);
    }
}
