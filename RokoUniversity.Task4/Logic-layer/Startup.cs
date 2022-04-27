using Entity_Res;
using System;

namespace Logic_layer
{
    public class Startup
    {
        public Startup()
        {
        m1:
            
            Console.WriteLine("You want to play with global or local-mode?");
            string line = Console.ReadLine();
            if (line.Equals("local"))
            {
                PlayGameWithLocalMode.PlayMain();
            }
            else
            {
                Console.WriteLine("Please write your username");            
                string username = Console.ReadLine();
            m2:
                Console.WriteLine($"If you want to see your saves - 1 {Environment.NewLine}" +
                    $"If you want to see global statistic - 2{Environment.NewLine}" +
                    $"If yot want to start play at first - 3{Environment.NewLine}" +
                    $"If you want restart - 4 or something");
                int k = int.Parse(Console.ReadLine());
                switch (k)
                {
                    case 1:
                        int difficultylvl = 0;
                        int speed;
                        Map? map = PlayGameWithGlobalMode.PresentationSaves(username, ref difficultylvl, out speed);
                        if (map != null)
                        {
                            PlayGameWithGlobalMode.PlayMain(username, difficultylvl, speed, map);
                        }
                        goto m2;    
                    case 2:
                        PresentationGlobalStatistic.PresMain();
                        goto m2;
                    case 3: 
                        PlayGameWithGlobalMode.PlayMain(username, 1, 0);
                        goto m2;
                    default:
                        goto m1;
                }
            }
        }
    }
}
