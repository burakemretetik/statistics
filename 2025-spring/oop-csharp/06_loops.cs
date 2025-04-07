using System;

class Loops
{
    static void Main()
    {
        int evenSum = 0;
        for (int i = 0; i <= 24; i += 2)
            evenSum += i;
        Console.WriteLine($"Sum of even numbers 0..24: {evenSum}");

        Console.Write("Primes below 50:");
        for (int n = 2; n < 50; n++)
        {
            bool prime = true;
            for (int d = 2; d * d <= n; d++)
            {
                if (n % d == 0)
                {
                    prime = false;
                    break;
                }
            }
            if (prime) Console.Write(" " + n);
        }
        Console.WriteLine();

        int number = 98765, digits = 0, digitSum = 0;
        int temp = number;
        while (temp > 0)
        {
            digitSum += temp % 10;
            temp /= 10;
            digits++;
        }
        Console.WriteLine($"{number}: {digits} digits, digit sum {digitSum}");

        // keep reading until 0 is entered
        double total = 0;
        int count = 0;
        double x;
        do
        {
            Console.Write("Number (0 to stop): ");
            x = double.Parse(Console.ReadLine());
            if (x == 0) continue;
            total += x;
            count++;
        } while (x != 0);

        if (count > 0)
            Console.WriteLine($"Mean of {count} numbers: {total / count:F2}");

        for (int i = 1; i <= 9; i++)
        {
            for (int j = 1; j <= 9; j++)
                Console.Write($"{i * j,4}");
            Console.WriteLine();
        }
    }
}
