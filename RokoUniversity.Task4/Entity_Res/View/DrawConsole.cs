using Entity_Res.GameObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Res.View
{
    public static class DrawConsole
    {
        public static Map map { get; set; }
        public static void DrawMap()
        {
            Console.ForegroundColor = ConsoleColor.Gray;
            for (int i = 0; i < map.Width + 2; i++)
            {
                Console.SetCursorPosition(i, 0);
                Console.WriteLine('\u2593');
                Console.SetCursorPosition(i, map.Height + 1);
                Console.WriteLine('\u2593');
            }
            for (int i = 0; i < map.Height + 2; i++)
            {
                Console.SetCursorPosition(0, i);
                Console.WriteLine('\u2593');
                Console.SetCursorPosition(map.Width + 1, i);
                Console.WriteLine('\u2593');
            }
        }

        public static void DrawGameObject(int x, int y, char ch, ConsoleColor color)
        {
            Console.ForegroundColor = color;
            Console.SetCursorPosition(x, y);
            Console.Write(ch);
            Console.SetCursorPosition(0, map.Height + 2);
        }

        public static void DrawMovableObject(MovableObject movableObject, char ch, ConsoleColor color)
        {
            if (movableObject._oldX != 0 && movableObject._oldY != 0)
            {
                Console.SetCursorPosition(movableObject._oldX, movableObject._oldY);
                Console.WriteLine(" ");
            }
            Console.ForegroundColor = color;
            Console.SetCursorPosition(movableObject.X, movableObject.Y);
            Console.Write(ch);
            Console.SetCursorPosition(0, map.Height + 2);

        }

        public static void DrawPlayerHp(PlayerClass player)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            if (player._oldHp == 0)
            {
                Console.SetCursorPosition(map.Width + 2, 0);
                Console.Write($"{(char)9829}100");
            }
            else if (player._oldHp == 100)
            {
                Console.SetCursorPosition(map.Width + 2, 0);
                Console.WriteLine($"{(char)9829}{player.HP} ");
            }
            else if (player._oldHp > 9 && player.HP < 10)
            {
                Console.SetCursorPosition(map.Width + 2, 0);
                Console.WriteLine($"{(char)9829}{player.HP} ");
            }
            else
            {
                Console.SetCursorPosition(map.Width + 2, 0);
                Console.WriteLine($"{(char)9829}{player.HP}");
            }
            Console.SetCursorPosition(0, map.Height + 2);

        }

        public static void WriteMessage(string message, ConsoleColor color, int x = 5)
        {
            Console.SetCursorPosition(map.Width + 2, x);
            Console.ForegroundColor = color;
            Console.WriteLine(message);
            Console.SetCursorPosition(0, map.Height + 2);
        }
    }
}
