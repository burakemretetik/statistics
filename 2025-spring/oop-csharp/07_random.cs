using System;

class RandomNumbers
{
    static void Main()
    {
        Random rnd = new Random();

        Console.WriteLine(rnd.Next(10, 20));
        Console.WriteLine(rnd.Next(50));
        Console.WriteLine(rnd.NextDouble());

        int rolls = 6000;
        int[] counts = new int[7];
        for (int i = 0; i < rolls; i++)
            counts[rnd.Next(1, 7)]++;

        for (int face = 1; face <= 6; face++)
            Console.WriteLine($"{face}: {counts[face],5}  {(double)counts[face] / rolls:F3}");

        int heads = 0, tosses = 100000;
        for (int i = 0; i < tosses; i++)
            if (rnd.NextDouble() < 0.5) heads++;
        Console.WriteLine($"P(heads) ~ {(double)heads / tosses:F4}");

        // mean of uniform(0,1) should be close to 0.5
        double sum = 0;
        for (int i = 0; i < tosses; i++)
            sum += rnd.NextDouble();
        Console.WriteLine($"mean ~ {sum / tosses:F4}");

        int target = rnd.Next(1, 101), guess, tries = 0;
        do
        {
            Console.Write("Guess (1-100): ");
            guess = int.Parse(Console.ReadLine());
            tries++;
            if (guess < target) Console.WriteLine("higher");
            else if (guess > target) Console.WriteLine("lower");
        } while (guess != target);
        Console.WriteLine($"Found it in {tries} tries");
    }
}
