using Entity_Res.View;
using System;

namespace Entity_Res.GameObjects.Obstacles
{
    [Serializable]
    public class Stone : GameObject
    {
        public override void Draw()
        {
            DrawConsole.DrawGameObject(X, Y, (char)8962, ConsoleColor.Gray);
        }
    }
}
