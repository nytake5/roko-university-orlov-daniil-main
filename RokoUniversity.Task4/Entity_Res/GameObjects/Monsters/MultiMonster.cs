using Entity_Res.GameObjects.Benefits.BenefitsBoost;

namespace Entity_Res.GameObjects.Monsters
{
    public abstract class MultiMonster : MonsterObject
    {
        public override BenefitBoost GetImpact()
        {
            BenefitBoost temp = default;
            foreach (var item in Map.GameObjects)
            {
                BenefitBoost benefit = item as BenefitBoost;
                if (benefit != null && X == benefit.X && benefit.Y == Y)
                {
                    switch (benefit.Operation)
                    {
                        case Impact.Multiply:
                            this.Damage *= benefit.Boost;
                            break;
                        case Impact.Lightness:
                            this.LightnessTime += benefit.Boost;
                            break;
                        default:
                            break;
                    }
                    temp = benefit;
                }
            }
            return temp;
        }
    }
}
