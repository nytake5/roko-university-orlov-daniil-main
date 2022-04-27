using Entity_Res;
using System;
using System.Collections.Generic;

namespace DAL_Interface
{
    public interface IGameDAL
    {
        int InsertMap(Map map);
        Map LoadMap(int mapID);
        void InsertGameLevel(Map map, int difficultyLevel);
        Map LoadGameLevel(int difficultyLevel);
        void InsertPlayerSaves(string username, Map map, int difficultylvl, int speedOfPassage);
        List<PlayerSaves> LoadPlayerSaves(string username);

        void InsertStatisticElem(string username, int speedOfPassage, int difficultylvl, int mapID);
        List<List<StatisticElem>> LoadListStatisticElem();
    }
}
