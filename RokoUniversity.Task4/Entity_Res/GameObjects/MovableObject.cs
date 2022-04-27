using Entity_Res.GameObjects.Benefits.BenefitsBoost;
using Entity_Res.GameObjects.Traps;
using System;
using System.Text.Json.Serialization;

namespace Entity_Res.GameObjects
{
    [Serializable]
    public abstract class MovableObject : GameObject
    {
        public int _oldX { get; set; }
        public int _oldY { get; set; }

        private int lightnessTime = 0;
        public int _oldHp { get; set; }

        private int MovableHP = 100;
        public int HP
        {
            get
            {
                return MovableHP;
            }
            set
            {
                _oldHp = MovableHP;
                MovableHP = value;
                if (MovableHP > 100)
                {
                    MovableHP = 100;
                }
                else if (MovableHP < 0)
                {
                    MovableHP = 0;
                }
            }
        }
        public int LightnessTime
        {
            get
            {
                return lightnessTime;
            }
            set
            {
                lightnessTime = value;
            }
        }
        public Map Map { get; set; }

        public virtual void Move()
        {
            _oldX = X;
            _oldY = Y;

            ChangePosition();

            if (lightnessTime > 0 && Map.CanMove(X, Y))
            {
                lightnessTime--;
            }
            else if (lightnessTime < 0)
            {
                X = _oldX;
                Y = _oldY;
                lightnessTime++;
            }
            else if (!Map.CanMove(X, Y) || !CanMove())
            {
                X = _oldX;
                Y = _oldY;
            }
        }

        protected abstract void ChangePosition();

        protected virtual bool CanMove()
        {
            foreach (var item in Map.GameObjects)
            {
                if (item != this && item is not IPermeable && item.X == X && item.Y == Y)
                {
                    return false;
                }
            }
            return true;
        }

        public virtual BenefitBoost GetImpact()
        {
            BenefitBoost temp = null;

            for (int i = 0; i < Map.GameObjects.Count; i++)
            {
                BenefitBoost benefit = Map.GameObjects[i] as BenefitBoost;
                if (benefit != null && X == benefit.X && benefit.Y == Y)
                {
                    switch (benefit.Operation)
                    {
                        case Impact.Lightness:
                            this.LightnessTime = LightnessTime + benefit.Boost;
                            break;
                        default:
                            break;
                    }
                    temp = benefit;
                }
            }
            return temp;
        }

        public virtual void CheckStepsIntoTrap()
        {
            for (int i = 0; i < Map.GameObjects.Count; i++)
            {
                TrapObject trap = Map.GameObjects[i] as TrapObject; 
                if (trap != null && X == trap.X && trap.Y == Y && !trap.Triggered)
                {
                    switch (trap.effect)
                    {
                        case TrapEffect.Paralyze:
                            this.LightnessTime -= trap.amountOfEffect;
                            trap.Triggered = true;
                            break;
                        case TrapEffect.Damage:
                            this.HP -= trap.amountOfEffect;
                            trap.Triggered = true;
                            break;
                        default:
                            break;
                    }
                }
            }
        }
    }
}
