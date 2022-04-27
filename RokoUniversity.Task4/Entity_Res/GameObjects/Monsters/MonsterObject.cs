using Entity_Res.GameObjects.Benefits.BenefitsBoost;
using Newtonsoft.Json;
using System;

namespace Entity_Res.GameObjects.Monsters
{
    [Serializable]
    public abstract class MonsterObject : MovableObject, IDamage
    {
        [JsonIgnore]
        public readonly Random rnd = new Random();

        private int _damage;

        public int Damage
        {
            get
            {
                return _damage;
            }
            set
            {
                _damage = value;
                if (_damage > 100)
                {
                    _damage = 100;
                }
                else if (_damage < 0)
                {
                    _damage = 0;
                }
            }
        }
        protected override void ChangePosition()
        {
            X += rnd.Next(3) - 1;
            Y += rnd.Next(3) - 1;
        }
        protected override bool CanMove()
        {
            foreach (var item in Map.GameObjects)
            {
                if (LightnessTime == 0)
                {
                    if (item != this && item.X == X && item.Y == Y && item is not IPermeableForMonster)
                    {
                        return false;
                    }
                }
            }
            return true;
        }
        public void Hit()
        {
            if (X == Map.Player.X && Y == Map.Player.Y)
            {
                Map.Player.HP = Map.Player.HP - this.Damage;
            }
        }
    }
}
