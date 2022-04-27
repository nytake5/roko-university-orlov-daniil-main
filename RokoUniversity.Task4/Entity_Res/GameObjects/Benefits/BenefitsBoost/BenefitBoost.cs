namespace Entity_Res.GameObjects.Benefits.BenefitsBoost
{
    public abstract class BenefitBoost : BenefitObject, IPermeableForMonster
    {
        public int Boost { get; set; }
        public Impact Operation { get; set; }       
    }
}
