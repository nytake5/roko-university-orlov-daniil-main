using Entity_Res;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Interface
{
    public interface IGameDAL_Json
    {
        int InsertMap(Map map);
        Map LoadMap();
    }
}
