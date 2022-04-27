using System;

namespace Entity_Res.GameObjects.Obstacles
{
    [Serializable]
    public abstract class DamageObstacles : GameObject, IPermeable
    {
        public int Damage { get; set; }
    }
}
