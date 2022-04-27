using Entity_Res    .View;
using System;
using System.Text.Json.Serialization;

namespace Entity_Res.GameObjects
{
    public class PlayerClass : MovableObject, IPermeable
    {
        private PlayerCommand _command;
        
        public override void Draw()
        {
            DrawConsole.DrawMovableObject(this, (char)9787, ConsoleColor.Yellow);
            DrawConsole.DrawPlayerHp(this);
        }
        public void SetCommand(PlayerCommand command)
        {
            _command = command;
        }

        protected override void ChangePosition()
        {
            switch (_command)
            {
                case PlayerCommand.Up:
                    Y--;
                    break;
                case PlayerCommand.Right:
                    X++;
                    break;
                case PlayerCommand.Down:
                    Y++;
                    break;
                case PlayerCommand.Left:
                    X--;
                    break;
                case PlayerCommand.None:
                    break;
            }
            _command = PlayerCommand.None;
        }

        public override bool Equals(object obj)
        {
            PlayerClass player = obj as PlayerClass;
            if (player == null)
            {
                return false;
            }
            if (this.X == player.X && this.Y == player.Y && this.HP == player.HP && this.LightnessTime == player.LightnessTime)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public override int GetHashCode()
        {
            throw new NotImplementedException();
        }
    }
}
