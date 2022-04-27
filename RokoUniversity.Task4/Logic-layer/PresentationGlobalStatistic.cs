using DAL_Interface;
using Dependencies;
using System;

namespace Logic_layer
{
    public static class PresentationGlobalStatistic
    {
        private static IGameDAL gameDALFull = Depend.gameDALFull;
        public static void PresMain()
        {
            var ListBestPassage = gameDALFull.LoadListStatisticElem();
            for (int i = 0; i < 7; i++)
            {
                Console.WriteLine($"The best passages for {i + 1} levels of difficulty");
                foreach (var item in ListBestPassage[i])
                {
                    Console.WriteLine(item.ToString());
                }
            }
        }
    }
}
