using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Res
{
    public class PlayerSaves
    {
        public string username { get; set; }
        public int mapID { get; set; }
        public DateTime date { get; set; }
        public int difficultyLvl { get; set; }
        public int speedOfPassage { get; set; }
        public override string ToString()
        {
            return $"{username} - {difficultyLvl} - {date}";
        }
    }
}
