using Entity_Res.GameObjects.Benefits.BenefitsBoost;

namespace Entity_Res.GameObjects.Traps
{
    public abstract class TrapObject : GameObject, IPermeableForMonster
    {
        public int amountOfEffect { get; set; }
        public TrapEffect effect { get; set; } 
        public bool Triggered { get; set;}
    }
}
