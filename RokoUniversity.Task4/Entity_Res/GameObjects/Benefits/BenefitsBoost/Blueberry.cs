using Entity_Res.View;
using Newtonsoft.Json;
using System;

namespace Entity_Res.GameObjects.Benefits.BenefitsBoost
{
    public class Blueberry : BenefitBoost
    {       
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)9600, ConsoleColor.DarkBlue);
        }
    }
}
