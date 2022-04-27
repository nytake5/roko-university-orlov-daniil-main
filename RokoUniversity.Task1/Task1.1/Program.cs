using System;
using System.Collections.Generic;

namespace Task1._1
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Random random = new Random();
            Console.Write("Count of array = ");
            int n = int.Parse(Console.ReadLine());
            if (n <= 0)
            {
                throw new ArgumentException("Count can't be non-positive");
            }
            int[] arr = new int[n];

            for (int i = 0; i < n; i++)
            {
                arr[i] = random.Next();
                Console.WriteLine(arr[i]);
            }

            Console.WriteLine($"max = {FindMax(arr)}");
            Console.WriteLine($"min = {FindMin(arr)}");
            Console.WriteLine($"avg = {(Sum(arr) * 1.0) / n}");
            Console.WriteLine($"mediana = {FindMedian(arr)}");
        }

        public static int FindMax(int[] arr)
        {
            int max = int.MinValue;
            for (int i = 0; i < arr.Length; i++)
            {
                if (max < arr[i])
                {
                    max = arr[i];
                }
            }
            return max;
        }
        public static int FindMin(int[] arr)
        {
            int min = int.MaxValue;
            for (int i = 0; i < arr.Length; i++)
            {
                if (min > arr[i])
                {
                    min = arr[i];
                }
            }
            return min;
        }
        public static int Sum(int[] arr)
        {
            int sum = 0;
            foreach (var item in arr)
            {
                sum += item;
            }
            return sum;
        }
        public static int FindMedian(int[] arr)
        {
            Dictionary<int, int> dc = new Dictionary<int, int>();

            for (int i = 0; i < arr.Length; i++)
            {
                if (dc.ContainsKey(arr[i]))
                {
                    dc[arr[i]]++;
                }
                else
                {
                    dc.Add(arr[i], 1);
                }
            }
            int median = 0;
            int cntMed = 0;
            foreach (var item in dc)
            {
                if (item.Value > cntMed)
                {
                    median = item.Key;
                    cntMed = item.Value;
                }
            }
            return median;
        }
    }
}
