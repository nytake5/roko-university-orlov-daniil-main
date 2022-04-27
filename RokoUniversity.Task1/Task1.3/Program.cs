using System;
using System.Collections.Generic;
using System.IO;

namespace Task1._3
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> arr = new List<int>();
            using (StreamReader reader = new StreamReader(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, args[0])))
            {
                string line = reader.ReadLine();
                while(!String.IsNullOrEmpty(line))  
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
            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i] < 0)
                {
                    arr[i] = 0;
                }
            }
            BubbleSort(arr);
            using (StreamWriter writer = new StreamWriter(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, args[1])))
            {
                foreach (var item in arr)
                {
                    writer.WriteLine(item);
                    Console.WriteLine(item);
                }
            }
        }
        public static void BubbleSort(List<int> arr)
        {
            for (int i = 0; i < arr.Count - 1; i++)
            {
                for (int j = 0; j < arr.Count - i - 1; j++)
                {
                    if (arr[j] > arr[j + 1])
                    {
                        int temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }
        }
    }
}
