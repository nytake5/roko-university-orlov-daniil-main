using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.View;
using DAL_Interface;
using System;
using Dependencies;
using Entity_Res.GameObjects.Benefits;

namespace Logic_layer
{
    public static class PlayGameWithLocalMode
    {
        private static IGameDAL gameDALFull = Depend.gameDALFull;
        private static IGameDAL_Json gameDALDemo = Depend.gameDAL_json;

        public static void PlayMain()
        {
            Console.Write($"The first three difficulty levels are available to you. {Environment.NewLine}" +
                    $"Choose the difficultyLvl: ");
            int difficultyLvl = int.Parse(Console.ReadLine());
            bool flag = true;
            while (difficultyLvl > 3 || difficultyLvl < 1)
            {
                Console.WriteLine("Only the first three levels are available to you!");
                difficultyLvl = int.Parse(Console.ReadLine());
            }

            while (flag)
            {
                if (difficultyLvl > 3)
                {
                    Console.WriteLine($"Only the first three levels are available to you! {Environment.NewLine}"
                        + $"log in and restart again!") ;
                    break;
                }
                Map map = gameDALFull.LoadGameLevel(difficultyLvl);
                DrawConsole.map = map;
                Console.Clear();
                map.Draw();
                DrawConsole.WriteMessage("Save - 1, Load - 2", ConsoleColor.Red);
                Play(map);
                Console.WriteLine($"Do you want to continue? {Environment.NewLine}" +
                    $"yes/no");
                string line = Console.ReadLine();
                switch (line)
                {
                    case "yes":
                        difficultyLvl++;
                        map = gameDALFull.LoadGameLevel(difficultyLvl);
                        break;
                    default:
                        flag = false;
                        break;
                }
            }
        }

        private static void Play(Map map)
        {
            ConsoleKeyInfo keyInfo = new ConsoleKeyInfo();
            do
            {
                keyInfo = Console.ReadKey();
                PlayerCommand command = PlayerCommand.None;
                switch (keyInfo.Key)
                {
                    case ConsoleKey.UpArrow:
                    case ConsoleKey.W:
                        command = PlayerCommand.Up;
                        break;
                    case ConsoleKey.RightArrow:
                    case ConsoleKey.D:
                        command = PlayerCommand.Right;
                        break;
                    case ConsoleKey.DownArrow:
                    case ConsoleKey.S:
                        command = PlayerCommand.Down;
                        break;
                    case ConsoleKey.LeftArrow:
                    case ConsoleKey.A:
                        command = PlayerCommand.Left;
                        break;
                    case ConsoleKey.D1:
                        gameDALDemo.InsertMap(map);
                        break;
                    case ConsoleKey.D2:
                        Console.Clear();
                        map = gameDALDemo.LoadMap();
                        break;
                }

                map.Player.SetCommand(command);
                foreach (var item in map.GameObjects)
                {
                    MovableObject movableObject = item as MovableObject;
                    movableObject?.Move();
                }

                map.PlayerGiveDamage();
                map.CheckStepsIntoTrap();
                map.GetImpact();
                map.PlayerGiveHealthBoost();
                map.CheckDeath();

                map.Draw();

                if (IsLoser(map))
                {
                    DrawConsole.WriteMessage("You lose!", ConsoleColor.Red, map.Height);
                    break;
                }

                if (IsWin(map))
                {
                    DrawConsole.WriteMessage("You win!!!", ConsoleColor.Red, map.Height);
                    break;
                }
                DrawConsole.map = map;

            } while (keyInfo.Key != ConsoleKey.Escape);
        }



        private static bool IsWin(Map map)
        {
            foreach (var item in map.GameObjects)
            {
                BenefitObject benefit = item as BenefitObject;
                if (benefit != null)
                {
                    return false;
                }
            }
            return true;
        }

        private static bool IsLoser(Map map)
        {
            if (map.Player.HP == 0)
            {
                return true;
            }
            return false;
        }
    }
}
