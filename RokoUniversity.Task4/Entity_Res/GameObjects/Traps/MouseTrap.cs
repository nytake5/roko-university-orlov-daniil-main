using Entity_Res.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity_Res.GameObjects.Traps
{
    public class MouseTrap : TrapObject
    {
        public override void Draw()
        {
            if (Triggered)
            {
                DrawConsole.DrawGameObject(X, Y, (char)934, ConsoleColor.Red);
            }
        }
    }
}
