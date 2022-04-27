using Entity_Res.View;
using Newtonsoft.Json;
using System;

namespace Entity_Res.GameObjects.Benefits.BenefitsBoost
{
    [Serializable]
    public class Raspberry : BenefitBoost
    {
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)23, ConsoleColor.DarkMagenta);
        }
    }
}
