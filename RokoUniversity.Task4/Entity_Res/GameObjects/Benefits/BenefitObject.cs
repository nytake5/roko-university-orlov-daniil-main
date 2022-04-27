namespace Entity_Res.GameObjects.Benefits
{
    public abstract class BenefitObject : GameObject, IPermeable
    {
        public int HealthBoost { get; set; }
    }
}
