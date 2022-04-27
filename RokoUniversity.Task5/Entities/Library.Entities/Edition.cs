using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Entities
{
    public class Edition
    {
        public string Publisher { get; set; }
        public string Title { get; set; }
        public string PlaceOfPublication { get; set; }

        public override string ToString() => $"{Title}/{Publisher}/{PlaceOfPublication}";
    }
}
