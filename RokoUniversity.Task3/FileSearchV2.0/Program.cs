using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace FileSearchV2._0
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Dictionary<char, int> dcSymbols = new Dictionary<char, int>();
            Dictionary<string, int> dcWords = new Dictionary<string, int>();
            string path;
            string mask;
            bool flagExcep = GettingParameters(args.ToList(), out path, out mask);
            if (!flagExcep)
            {
                return;
            }
            CheckDirectories(path, mask, dcSymbols, dcWords);
            WriteToFileWords(dcWords);
            WriteToFileSymbols(dcSymbols);
        }

        private static void WriteToFileSymbols(Dictionary<char, int> dcSymbols)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "symbols.txt";
            using (StreamWriter writer = new StreamWriter(path, false))
            {
                foreach (var item in dcSymbols)
                {
                    writer.WriteLine($"{item.Key} - {item.Value}");
                }
            }
        }

        private static void WriteToFileWords(Dictionary<string, int> dcWords)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "words.txt";
            using (StreamWriter writer = new StreamWriter(path, false))
            {
                foreach (var item in dcWords)
                {
                    writer.WriteLine($"{item.Key} - {item.Value}");
                }
            }
        }

        public static bool GettingParameters(List<string> args, out string path, out string mask)
        {
            path = AppDomain.CurrentDomain.BaseDirectory;
            bool flagPath = true;
            mask = "*";
            bool flagMask = true;
            try
            {
                while (args.Count > 0)
                {
                    if (Directory.Exists(args[0]) & flagPath)
                    {
                        path = args[0];
                        args.Remove(args[0]);
                        flagPath = false;
                    }
                    else if (flagMask)
                    {
                        mask = args[0];
                        flagMask = false;
                        args.Remove(args[0]);   
                    }
                    else
                    {
                        Logger.LogError("ArgumentException: Enter parameters correctly!");
                        return false;
                    }
                }
            }
            catch (IndexOutOfRangeException)
            {
                Logger.LogError("ArgumentException: Enter parameters correctly!");
                return false;
            }
            return true;
        }

        public static void CheckDirectories(string path, string mask, Dictionary<char, int> dcSymbols, Dictionary<string, int> dcWords)
        {
            try
            {
                foreach (var item in Directory.GetFiles(path, mask))
                {
                    CheckFiles(item, dcSymbols, dcWords);
                }
            }
            catch (SystemException)
            {
                Logger.LogError($"An error occurred, please try again");
            }
            try
            {
                var directiries = Directory.GetDirectories(path);
                for (int i = 0; i < directiries.Length; i++)
                {
                    CheckDirectories(directiries[i], mask, dcSymbols, dcWords);
                }
            }
            catch (SystemException)
            {
                Logger.LogError($"An error occurred, please try again");
            }
        }

        public static void CheckFiles(string path, Dictionary<char, int> dcSymbols, Dictionary<string, int> dcWords)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                string line = reader.ReadLine();
                while (line != null)
                {
                    line = line.ToLower();
                    WorkWithLetters(line, dcSymbols);
                    WorkWithWords(line, dcWords);
                    line = reader.ReadLine();
                }
            }
        }

        private static void WorkWithWords(string text, Dictionary<string, int> dcWords)
        {
            var regexWords = new Regex(@"\b\w+\b");
            var words = regexWords.Matches(text);
            foreach (var item in words)
            {
                if (dcWords.ContainsKey(item.ToString()))
                {
                    dcWords[item.ToString()] += 1;
                }
                else
                {
                    dcWords.Add(item.ToString(), 1);
                }
            }
        }

        private static void WorkWithLetters(string text, Dictionary<char, int> dcSymbols)
        {
            for (int i = 0; i < text.Length; i++)
            {
                if (MyIsSymbol(text[i]))
                {
                    if (dcSymbols.ContainsKey(text[i]))
                    {
                        dcSymbols[text[i]] += 1;
                    }
                    else
                    {
                        dcSymbols.Add(text[i], 1);
                    }
                }
            }
        }

        private static bool MyIsSymbol(char ch)
        {
            return Char.IsSymbol(ch) || Char.IsLetterOrDigit(ch) || Char.IsPunctuation(ch) || Char.IsSeparator(ch);
        }
    }
}
