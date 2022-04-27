using System;

namespace Entity_Res.GameObjects
{
    [Serializable]   
    public abstract class GameObject
    {
        public int X { get; set; }
        public int Y { get; set; }
        public abstract void Draw();
    }
}
