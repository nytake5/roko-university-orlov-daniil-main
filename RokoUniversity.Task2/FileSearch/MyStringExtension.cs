using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileSearch
{
    public static class MyStringExtension
    {
        public static List<int> OccurrenceIndex(this string line, string text)
        {
            List<int> res = new List<int>();
            int index = line.IndexOf(text);
            int lenCntRemove = 0;
            while (index != -1)
            {
                res.Add(index + lenCntRemove);
                line = line.Remove(index, text.Length);
                lenCntRemove += text.Length;
                index = line.IndexOf(text);
            }
            return res;
        }
    }
}
