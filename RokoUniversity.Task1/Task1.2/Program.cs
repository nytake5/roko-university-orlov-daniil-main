using System;

namespace Task1._2
{
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();
            Console.Write("Count of array = ");
            int n = int.Parse(Console.ReadLine());
            if (n <= 0)
            {
                throw new ArgumentException("Count can't be non-positive");
            }
            double[] arr = new double[n];
            int cnt = 0;

            for (int i = 0; i < n; i++)
            {
                arr[i] =  20 * random.NextDouble() - 10;
                Console.WriteLine(arr[i]);

                if (arr[i] > 0)
                {
                    cnt++;
                }
            }
            Console.WriteLine($"count = {cnt}");
        }
    }
}
