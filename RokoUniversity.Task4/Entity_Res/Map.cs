using System.Collections.Generic;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.GameObjects.Obstacles;
using Entity_Res.GameObjects.Traps;
using Entity_Res.View;

namespace Entity_Res
{
    public class Map
    {
        public int Width { get; set; }
        public int Height { get; set; }
        public List<GameObject> GameObjects { get; set; }
        public PlayerClass Player { get; set; }
        public int ID { get; set; }
        public void Draw()
        {
            DrawConsole.DrawMap();

            foreach (var item in GameObjects)
            {
                item.Draw();
            }
        }

        public bool CanMove(int x, int y)
        {
            return x > 0 && y > 0 && x <= Width && y <= Height;
        }

        public void PlayerGiveDamage()
        {
            foreach (var item in GameObjects)
            {
                DamageObstacles damageObstacles = item as DamageObstacles;
                if (damageObstacles != null && (damageObstacles.X == Player.X && damageObstacles.Y == Player.Y))
                {
                    Player.HP = Player.HP - damageObstacles.Damage;
                }
            }
        }

        public void PlayerGiveHealthBoost()
        {
            BenefitObject benefit = null;
            foreach (var item in GameObjects)
            {
                BenefitObject benefitObject = item as BenefitObject;
                if (benefitObject != null && (benefitObject.X == Player.X && benefitObject.Y == Player.Y))
                {
                    Player.HP = Player.HP + benefitObject.HealthBoost;
                    benefit = benefitObject;
                }
            }
            if (benefit != null)
            {
                GameObjects.Remove(benefit);
            }
        }

        public void GetImpact()
        {
            BenefitObject benefit = null;
            for (int i = 0; i < GameObjects.Count; i++)
            {
                MovableObject movable = GameObjects[i] as MovableObject;
                if (movable != null)
                {
                    benefit = movable.GetImpact();
                    if (benefit != null)
                    {
                        GameObjects.Remove(benefit);
                    }
                }
            }
        }

        public void CheckStepsIntoTrap()
        {
            for (int i = 0; i < GameObjects.Count; i++)
            {
                MovableObject movable = GameObjects[i] as MovableObject;
                if (movable != null)
                {
                    movable.CheckStepsIntoTrap();
                }
            }
        }

        public void CheckDeath()
        {
            for (int i = 0; i < GameObjects.Count; i++)
            {
                MovableObject movable = GameObjects[i] as MovableObject;
                if (movable != null && movable.HP == 0 && movable is not PlayerClass)
                {
                    GameObjects.Remove(movable);
                    i--;
                }
            }
        }
    }
}
