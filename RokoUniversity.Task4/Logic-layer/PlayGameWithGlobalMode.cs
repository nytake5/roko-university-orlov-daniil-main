using DAL_Interface;
using Dependencies;
using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.View;
using System;

namespace Logic_layer
{
    public static class PlayGameWithGlobalMode
    {

        private static IGameDAL gameDALFull = Depend.gameDALFull;
        public static void PlayMain(string username, int difficultyLvl, int speedOfPassage, Map map = null)
        {
            bool flag = true;
            while (flag)
            {
                
                if (map == null && difficultyLvl < 0)
                {
                    map = gameDALFull.LoadGameLevel(1);
                }
                else if(map == null && difficultyLvl > 0) 
                {
                    map = gameDALFull.LoadGameLevel(difficultyLvl);
                }
                
                DrawConsole.map = map;
                Console.Clear();
                map.Draw();
                DrawConsole.WriteMessage("Save - 1, Load - 2, Exit - Esc", ConsoleColor.Red);
                bool isLose;
                bool isWin = PlayProcces(username, map, difficultyLvl, speedOfPassage, out isLose);
                
                if (!isWin)
                {
                    if (isLose)
                    {
                        Restart(username, difficultyLvl);
                    }
                    else
                    {
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
                else
                {
                    break;
                }
            }
        }


        private static bool PlayProcces(string username, Map map, int difficultyLvl, int speedOfPassage, out bool isLose)
        {
            int currSpeedOfPassage = speedOfPassage;
            ConsoleKeyInfo keyInfo = new ConsoleKeyInfo();
            isLose = false;
            do
            {
                currSpeedOfPassage++;
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
                        currSpeedOfPassage--;
                        gameDALFull.InsertPlayerSaves(username, map, difficultyLvl, currSpeedOfPassage);
                        break;
                    case ConsoleKey.D2:
                        Console.Clear();
                        int tempSpeed = 0;
                        var tempMap = PresentationSaves(username, ref difficultyLvl, out tempSpeed);
                        if (tempMap == null)
                        {
                            DrawConsole.WriteMessage($"Do you want to continue the current level or start over? {Environment.NewLine}" +
                                $"cont/start", ConsoleColor.Red, map.Height);
                            string line = Console.ReadLine();
                            if (line.Equals("start"))
                            {
                                PlayMain(username, difficultyLvl, 0);
                            }
                        }
                        else
                        {
                            Console.Clear();
                            PlayMain(username, difficultyLvl, tempSpeed, tempMap);
                        }
                        break;
                }

                map.Player.SetCommand(command);
                foreach (var item in map.GameObjects)
                {
                    MovableObject movableObject = item as MovableObject;
                    movableObject?.Move();  
                }
                
                map.GetImpact();
                map.PlayerGiveHealthBoost();
                map.PlayerGiveDamage();
                map.CheckStepsIntoTrap();
                map.CheckDeath();

                map.Draw();

                if (IsLoser(map))
                {
                    DrawConsole.WriteMessage("You lose!", ConsoleColor.Red, map.Height);
                    isLose = true;
                    return false;
                }

                if (IsWin(map))
                {
                    DrawConsole.WriteMessage("You win!!!", ConsoleColor.Red, map.Height);
                    gameDALFull.InsertStatisticElem(username, currSpeedOfPassage, difficultyLvl, map.ID);
                    if (difficultyLvl == 7)
                    {
                        DrawConsole.WriteMessage("Congratulations, you have passed the game!", ConsoleColor.Red, map.Height);
                        return true;
                    }
                    return false;
                }
                DrawConsole.map = map;

            } while (keyInfo.Key != ConsoleKey.Escape);
            return false;
        }

        private static void Restart(string username, int difficultyLvl)
        {
            Console.WriteLine($"Do you want to restart this level?{Environment.NewLine}" +
                $"yes/no");
            string line = Console.ReadLine();
            if (line.Equals("yes"))
            {
                PlayMain(username, difficultyLvl, 0);
            }
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
        public static Map? PresentationSaves(string username, ref int difficultyLvl, out int speed)
        {
            var userSaves = gameDALFull.LoadPlayerSaves(username);
            speed = 0;
            if (userSaves.Count == 0)
            {
                Console.WriteLine("You don't have saves yet");
                return null;
            }
            else
            {
                int i = 1;
                foreach (var item in userSaves)
                {
                    Console.WriteLine($"{i} - {item.ToString()}");
                    i++;
                }
            }
            Console.WriteLine("You want load someone? - yes/no");
            string line = Console.ReadLine();
            if (line == "no")
            {
                PlayMain(username, 1, 0);
                difficultyLvl = -1;
                return null;
            }
            Console.WriteLine("Please, write the save number!");
            int k = int.Parse(Console.ReadLine());
            while (userSaves.Count < k || k < 1)
            {
                Console.WriteLine("Please try again! There is no such saving!");
                k = int.Parse(Console.ReadLine());
            }
            speed = userSaves[k - 1].speedOfPassage;
            difficultyLvl = userSaves[k - 1].difficultyLvl;
            return gameDALFull.LoadMap(userSaves[k - 1].mapID);
        }
    }
}
