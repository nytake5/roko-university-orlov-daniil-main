using Entity_Res.View;
using Newtonsoft.Json;
using System;

namespace Entity_Res.GameObjects.Benefits
{
    [Serializable]
    public class Pineapple : BenefitObject
    {
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)9660, ConsoleColor.Yellow);
        }
    }
}
