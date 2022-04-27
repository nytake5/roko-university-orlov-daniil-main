using Entity_Res.View;
using Newtonsoft.Json;
using System;

namespace Entity_Res.GameObjects.Benefits
{
    [Serializable]
    public class Cherry : BenefitObject
    {
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)9830, ConsoleColor.Red);
        }
    }
}
