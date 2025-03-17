using System;

class Conditions
{
    static void Main()
    {
        Console.Write("Midterm: ");
        double midterm = double.Parse(Console.ReadLine());
        Console.Write("Final: ");
        double final = double.Parse(Console.ReadLine());

        double avg = midterm * 0.4 + final * 0.6;

        string letter;
        if (avg >= 90) letter = "AA";
        else if (avg >= 85) letter = "BA";
        else if (avg >= 80) letter = "BB";
        else if (avg >= 75) letter = "CB";
        else if (avg >= 70) letter = "CC";
        else if (avg >= 60) letter = "DC";
        else if (avg >= 50) letter = "DD";
        else letter = "FF";

        Console.WriteLine($"Average: {avg:F2} ({letter})");

        if (final < 50)
            Console.WriteLine("Failed: final must be at least 50");
        else if (avg >= 60)
            Console.WriteLine("Passed");
        else
            Console.WriteLine("Failed");

        Console.Write("Month (1-12): ");
        int month = int.Parse(Console.ReadLine());

        switch (month)
        {
            case 12:
            case 1:
            case 2:
                Console.WriteLine("Winter");
                break;
            case 3:
            case 4:
            case 5:
                Console.WriteLine("Spring");
                break;
            case 6:
            case 7:
            case 8:
                Console.WriteLine("Summer");
                break;
            case 9:
            case 10:
            case 11:
                Console.WriteLine("Autumn");
                break;
            default:
                Console.WriteLine("No such month");
                break;
        }
    }
}
