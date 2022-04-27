using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace FileSearch
{
    public class SomeInfoCollection
    {
        public string path { get; set; }
        List<SomeInfo> someInfos { get; set; } 
        public SomeInfoCollection()
        {
            path = "";
            someInfos = new List<SomeInfo>();
        }
        public SomeInfoCollection(string path, List<SomeInfo> someInfos)
        {
            this.path = path;
            this.someInfos = someInfos;
        }
        public void Add(SomeInfo some)
        {
            someInfos.Add(some);    
        }
        public bool isEmpty
        {
            get
            {
                if (someInfos.Count == 0)
                {
                    return true;
                }
                return false;
            }
        }
        public void PrintToConsole()
        {
            var regex = new Regex(@"[\w+.]+\w+$");
            var res = regex.Match(path);
            Console.WriteLine(res.Value);
            foreach (var item in someInfos)
            {
                Console.WriteLine(item.ToString());
            }
        }
    }
}
