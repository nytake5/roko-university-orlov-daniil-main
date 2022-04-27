using Entity_Res.View;
using System;

namespace Entity_Res.GameObjects.Monsters
{
    [Serializable]
    public class Wolf : MonsterObject, IDamage
    {
        public override void Draw()
        {
            DrawConsole.DrawMovableObject(this, 'W', ConsoleColor.DarkYellow);
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
