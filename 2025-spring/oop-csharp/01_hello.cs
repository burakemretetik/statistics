using System;

class Hello
{
    static void Main()
    {
        Console.Write("What's your name? ");
        string name = Console.ReadLine();

        Console.Write("Which year were you born? ");
        int year = int.Parse(Console.ReadLine());

        int age = DateTime.Now.Year - year;
        Console.WriteLine("Hello " + name + ", you are about " + age + " years old.");
    }
}
