using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace FileSearch
{
    public class Program
    {

        public static void Main(string[] args)
        {
            List<SomeInfoCollection> listInfo = new List<SomeInfoCollection>();
            string path;
            string mask;
            Regex regexText;
            string text;
            bool useRegex;
            bool flagExcep = GettingParameters(args.ToList(), out path, out mask, out regexText, out text, out useRegex);
            if (!flagExcep)
            {
                return;
            }
            CheckDirectories(path, mask, regexText, text, useRegex, listInfo);
            PrintSomeInfo(listInfo);
        }
        public static void PrintSomeInfo(List<SomeInfoCollection> listInfo)
        {
            foreach (var item in listInfo)
            {
                item.PrintToConsole();
            }
        }

        public static bool GettingParameters(List<string> args, out string path, out string mask, out Regex regexText, out string text, out bool useRegex)
        {
            path = AppDomain.CurrentDomain.BaseDirectory;
            bool flagPath = true;
            mask = "*";
            regexText = new Regex("");
            useRegex = false;
            text = "";
            bool flagText = false;
            try
            {
                while (args.Count > 0)
                {
                    if (Directory.Exists(args[0]) && flagPath)
                    {
                        path = args[0];
                        flagPath = false;
                        args.Remove(path);
                    }
                    else if (args[0].Equals("-r"))
                    {
                        regexText = new Regex(args[1]);
                        useRegex = true;
                        args.Remove("-r");
                        args.Remove(args[0]);
                    }
                    else if (args[0].Equals("-m"))
                    {
                        mask = args[1];
                        args.Remove("-m");
                        args.Remove(args[0]);
                    }
                    else if (!useRegex && args.Count != 0)
                    {
                        text = args[0];
                        flagText = true;
                        args.Remove(args[0]);
                    }
                    else
                    {
                        Logger.LogError("InvalidDataException: You entered something strange!");
                        return false;
                    }
                }
            }
            catch (SystemException)
            {
                Logger.LogError("ArgumentException: Enter parameters correctly!");
                return false;
            }
            if (useRegex == flagText)
            {
                Logger.LogError("ArgumentException: Enter your input!");
                return false;
            }
            return true;
        }

        public static void CheckDirectories(string path, string mask, Regex regexText, string text, bool useRegex, List<SomeInfoCollection> listInfo)
        {
            try
            {
                foreach (var item in Directory.GetFiles(path, mask))
                {
                    var someInfo = CheckFiles(item, regexText, text, useRegex);
                    if (!someInfo.isEmpty)
                    {
                        listInfo.Add(someInfo);
                    }
                }
            }
            catch (SystemException) 
            {
                Logger.LogError($"An error occurred, please try again");
            }
            try
            {
                foreach (var item in Directory.GetDirectories(path))
                {
                    CheckDirectories(item, mask, regexText, text, useRegex, listInfo);
                }
            }
            catch (SystemException)
            {
                Logger.LogError($"An error occurred, please try again");
            }
        }

        public static SomeInfoCollection CheckFiles(string path, Regex regex, string text, bool useRegex)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                int indexStr = 1;
                string line = reader.ReadLine();
                SomeInfoCollection someInfo = new SomeInfoCollection();
                while (line != null)
                {
                    CreateSomeInfo(line, indexStr, regex, text, useRegex, ref someInfo);
                    indexStr++;
                    line = reader.ReadLine();
                }
                if (!someInfo.isEmpty)
                {
                    someInfo.path = path;
                }
                return someInfo;
            }
        }

        private static void CreateSomeInfo(string line, int indexStr, Regex regex, string text, bool useRegex, ref SomeInfoCollection someInfo)
        {
            if (useRegex)
            {
                var res = regex.Matches(line);
                if (res.Count == 0)
                {
                    return;
                }
                foreach (Match item in res)
                {
                    someInfo.Add(new SomeInfo(indexStr, item.Index, item.Value));
                }
            }
            else
            {
                var res = line.OccurrenceIndex(text);
                if (res.Count == 0)
                {
                    return; 
                }
                foreach (var item in res)
                {
                    someInfo.Add(new SomeInfo(indexStr, item, text));
                }
            }
            
        }
    }
}
