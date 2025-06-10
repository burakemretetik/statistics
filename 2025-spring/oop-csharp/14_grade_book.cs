using System;
using System.Collections.Generic;
using System.Linq;

class Student
{
    public string Name { get; }
    public double Midterm { get; }
    public double Final { get; }

    public Student(string name, double midterm, double final)
    {
        Name = name;
        Midterm = midterm;
        Final = final;
    }

    public double Average => Midterm * 0.4 + Final * 0.6;

    public bool Passed => Average >= 60 && Final >= 50;

    public override string ToString() =>
        $"{Name,-10}{Midterm,6}{Final,6}{Average,8:F1}  {(Passed ? "pass" : "fail")}";
}

class GradeBook
{
    private readonly List<Student> students = new List<Student>();

    public void Add(Student s) => students.Add(s);

    public double Mean() => students.Average(s => s.Average);

    public double StdDev()
    {
        double m = Mean();
        double ss = students.Sum(s => Math.Pow(s.Average - m, 2));
        return Math.Sqrt(ss / (students.Count - 1));
    }

    public Student Best() => students.OrderByDescending(s => s.Average).First();

    public void Print()
    {
        Console.WriteLine($"{"Name",-10}{"Mid",6}{"Fin",6}{"Avg",8}");
        foreach (Student s in students)
            Console.WriteLine(s);
        Console.WriteLine();
        Console.WriteLine($"class mean {Mean():F2}, sd {StdDev():F2}");
        Console.WriteLine($"pass rate {students.Count(s => s.Passed) * 100.0 / students.Count:F0}%");
        Console.WriteLine($"best: {Best().Name}");
    }
}

class Program
{
    static void Main()
    {
        GradeBook book = new GradeBook();
        book.Add(new Student("Ali", 55, 70));
        book.Add(new Student("Ayse", 80, 92));
        book.Add(new Student("Mehmet", 40, 45));
        book.Add(new Student("Zeynep", 70, 58));
        book.Add(new Student("Can", 90, 40));
        book.Print();
    }
}
