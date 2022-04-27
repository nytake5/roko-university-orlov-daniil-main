using Entity_Res.View;
using System;

namespace Entity_Res.GameObjects.Monsters
{
    [Serializable]
    public class Bear : MultiMonster
    {
        public override void Draw()
        {
            DrawConsole.DrawMovableObject(this, 'B', ConsoleColor.DarkYellow);
        }

        public override void Move()
        {
            _oldX = X;
            _oldY = Y;

            ChangePosition();

            if (!Map.CanMove(X, Y) || !CanMove())
            {
                X = _oldX;
                Y = _oldY;
                Hit();
            }
        }
    }
}
