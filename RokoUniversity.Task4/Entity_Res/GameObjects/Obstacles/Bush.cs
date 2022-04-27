using Entity_Res.View;
using System;

namespace Entity_Res.GameObjects.Obstacles
{

    [Serializable]
    public class Bush : DamageObstacles
    {
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)9827, ConsoleColor.Green);
        }
    }
}
