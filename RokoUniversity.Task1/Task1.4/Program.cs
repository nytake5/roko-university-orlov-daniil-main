using System;
using System.Collections.Generic;
using System.IO;

namespace Task1._4
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Random random = new Random();
            List<int> arr = new List<int>();
            using (StreamReader reader = new StreamReader(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, args[0])))
            {
                string line = reader.ReadLine();
                while (!String.IsNullOrEmpty(line))
                {
                    int temp;
                    if (int.TryParse(line, out temp))
                    {
                        arr.Add(temp);
                        Console.WriteLine(temp);
                    }
                    else
                    {
                        throw new ArgumentException("Value can't be used!");
                    }
                    line = reader.ReadLine();
                }
            }
            int k = random.Next(-10, 10);
            Console.WriteLine($"SumPositive = {SumPositive(arr)}");
            Console.WriteLine($"SumNegative = {SumNegative(arr)}");
            Console.WriteLine($"Sum more k = {SumOverK(arr, k)}");
        }

        public static int SumPositive(List<int> arr)
        {
            int sum = 0;
            foreach (var item in arr)
            {
                if (item > 0)
                {
                    sum += item;
                }
            }
            return sum;
        }
        public static int SumNegative(List<int> arr)
        {
            int sum = 0;
            foreach (var item in arr)
            {
                if (item < 0)
                {
                    sum += item;
                }
            }
            return sum;
        }
        
        public static int SumOverK(List<int> arr, int k)
        {
            int sum = 0;
            foreach (var item in arr)
            {
                if (item > k)
                {
                    sum += item;
                }
            }
            return sum;
        }
    }
}
