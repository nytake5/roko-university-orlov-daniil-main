using DAL_Interface;
using Dependencies;
using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.GameObjects.Benefits.BenefitsBoost;
using Entity_Res.GameObjects.Monsters;
using Entity_Res.GameObjects.Obstacles;
using Entity_Res.GameObjects.Traps;
using System;
using System.Collections.Generic;

namespace Logic_layer
{
    public static class GenerateSevenLevel
    {
        private static IGameDAL gameDAL;
        public static void Start()
        {
            gameDAL = Depend.gameDALFull;
            gameDAL.InsertGameLevel(GenerateLevel1(), 1);
            gameDAL.InsertGameLevel(GenerateLevel2(), 2);
            gameDAL.InsertGameLevel(GenerateLevel3(), 3);
            gameDAL.InsertGameLevel(GenerateLevel4(), 4);
            gameDAL.InsertGameLevel(GenerateLevel5(), 5);
            gameDAL.InsertGameLevel(GenerateLevel6(), 6);
            gameDAL.InsertGameLevel(GenerateLevel7(), 7);
        }

        public static Map GenerateLevel1()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 20, Height = 10 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 5);
            GenerateStone(rnd, map, mapFullness, 5);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);

            return map;
        }
        public static Map GenerateLevel2()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 10 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 3);

            return map;
        }
        public static Map GenerateLevel3()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 10 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 3);

            return map;
        }
        public static Map GenerateLevel4()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 10 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 3);
            GenerateBlueberry(rnd, map, mapFullness, 3);

            return map;
        }
        public static Map GenerateLevel5()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 20 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 3);
            GenerateBlueberry(rnd, map, mapFullness, 3);
            GenerateRaspberry(rnd, map, mapFullness, 3);
            GenerateBear(rnd, map, mapFullness, 3);

            return map;
        }
        public static Map GenerateLevel6()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 20 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 4);
            GenerateFox(rnd, map, mapFullness, 4);
            GenerateBlueberry(rnd, map, mapFullness, 3);
            GenerateRaspberry(rnd, map, mapFullness, 3);
            GenerateBear(rnd, map, mapFullness, 5);

            return map;
        }
        public static Map GenerateLevel7()
        {
            Random rnd = new Random();
            Map map = new Map() { Width = 40, Height = 20 };
            bool[,] mapFullness = new bool[map.Width + 1, map.Height + 1];
            PlayerClass player = new PlayerClass { X = 1, Y = 1 };
            map.Player = player;
            map.Player.Map = map;
            map.GameObjects = new List<GameObject>();
            map.GameObjects.Add(player);

            GenerateBush(rnd, map, mapFullness, 10);
            GenerateStone(rnd, map, mapFullness, 10);
            GenerateApple(rnd, map, mapFullness, 3);
            GenerateCherry(rnd, map, mapFullness, 3);
            GeneratePineapple(rnd, map, mapFullness, 3);
            GenerateWolf(rnd, map, mapFullness, 4);
            GenerateFox(rnd, map, mapFullness, 4);
            GenerateBlueberry(rnd, map, mapFullness, 3);
            GenerateRaspberry(rnd, map, mapFullness, 3);
            GenerateBear(rnd, map, mapFullness, 5);
            GenerateMouseTrap(rnd, map, mapFullness, 3);
            GeneratePitfall(rnd, map, mapFullness, 3);

            return map;
        }
        
        private static void CheckPoint(Random rnd, Map map, bool[,] mapFullness, out int tempX, out int tempY)
        {
            do
            {
                tempX = rnd.Next(1, map.Width + 1);
                tempY = rnd.Next(1, map.Height + 1);
            }
            while (mapFullness[tempX, tempY]);
            mapFullness[tempX, tempY] = true;
        }

        private static void GenerateBush(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Bush() { X = tempX, Y = tempY, Damage = 5 });
            }
        }

        private static void GenerateStone(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Stone() { X = tempX, Y = tempY });
            }
        }

        private static void GenerateApple(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Apple() { X = tempX, Y = tempY, HealthBoost = 20 });
            }
        }

        private static void GenerateCherry(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Cherry() { X = tempX, Y = tempY, HealthBoost = 10 });
            }
        }
        private static void GeneratePineapple(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Pineapple() { X = tempX, Y = tempY, HealthBoost = 30 });
            }
        }

        private static void GenerateWolf(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            for (int i = 0; i < cnt; i++)
            {
                map.GameObjects.Add(new Wolf() { X = rnd.Next(1, map.Width + 1), Y = rnd.Next(1, map.Height + 1), Damage = 30, Map = map });
            }
        }

        private static void GenerateFox(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            for (int i = 0; i < cnt; i++)
            {
                map.GameObjects.Add(new Fox() { X = rnd.Next(1, map.Width + 1), Y = rnd.Next(1, map.Height + 1), Damage = 20, Map = map });
            }
        }

        private static void GenerateBear(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            for (int i = 0; i < cnt; i++)
            {
                map.GameObjects.Add(new Bear() { X = rnd.Next(1, map.Width + 1), Y = rnd.Next(1, map.Height + 1), Damage = 40, Map = map });
            }
        }
        private static void GenerateMouseTrap(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            for (int i = 0; i < cnt; i++)
            {
                map.GameObjects.Add(new MouseTrap() { X = rnd.Next(1, map.Width + 1), Y = rnd.Next(1, map.Height + 1), amountOfEffect = 5, effect = TrapEffect.Paralyze });
            }
        }

        private static void GeneratePitfall(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {

            for (int i = 0; i < cnt; i++)
            {
                map.GameObjects.Add(new Pitfall() { X = rnd.Next(1, map.Width + 1), Y = rnd.Next(1, map.Height + 1), amountOfEffect = 20, effect = TrapEffect.Damage });
            }
        }

        private static void GenerateBlueberry(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Blueberry() { X = tempX, Y = tempY, HealthBoost = 0, Boost = 7, Operation = Impact.Lightness });
            }
        }

        private static void GenerateRaspberry(Random rnd, Map map, bool[,] mapFullness, int cnt)
        {
            int tempX = 0;
            int tempY = 0;
            for (int i = 0; i < cnt; i++)
            {
                CheckPoint(rnd, map, mapFullness, out tempX, out tempY);
                map.GameObjects.Add(new Raspberry() { X = tempX, Y = tempY, HealthBoost = 15, Boost = 2, Operation = Impact.Multiply });
            }
        }
    }
}
