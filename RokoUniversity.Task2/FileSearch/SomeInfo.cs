using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileSearch
{
    public class SomeInfo
    {
        public int indexStr { get; set; }
        public int indexInStr { get; set; }
        public string text { get; set; }
        public SomeInfo() { }
        public SomeInfo(int indexStr, int indexInStr, string text)
        {
            this.indexStr = indexStr;
            this.indexInStr = indexInStr;
            this.text = text;
        }
        public override string ToString()
        {
            return $"{indexStr} {indexInStr} {text}";
        }
    }
}
