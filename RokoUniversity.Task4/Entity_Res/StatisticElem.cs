using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Res
{
    public class StatisticElem
    {
        public string username { get; set; }
        public int speedOfPassage { get; set; }
        public int DifficultyLvl { get; set; }
        public int MapID { get; set; }
        public DateTime date { get; set; }
        public static string StringHead()
        {
            return $"Username - Speed of passage - Difficulty Level - Date of passage";
        }
        public override string ToString()
        {
            return $"{username} - {speedOfPassage} - {DifficultyLvl} - {date}";
        }
    }
}
