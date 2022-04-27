using Entity_Res.View;
using System;

namespace Entity_Res.GameObjects.Monsters
{
    [Serializable]
    public class Fox : MonsterObject, IDamage
    {
        public override void Draw()
        {
            DrawConsole.DrawMovableObject(this, 'F', ConsoleColor.DarkYellow);
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
