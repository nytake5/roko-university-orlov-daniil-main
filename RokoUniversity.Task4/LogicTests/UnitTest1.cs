using DAL_Interface;
using Dependencies;
using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.GameObjects.Obstacles;
using Entity_Res.GameObjects.Traps;
using Logic_layer;
using NUnit.Framework;

namespace LogicTests
{
    public class Tests
    {
        private readonly IGameDAL_Json gameDAL = Depend.gameDAL_json;
        private Map map;
        [SetUp]
        public void Setup()
        {
            map = GenerateSevenLevel.GenerateLevel1();
        }

        [Test]
        public void TestLoadMap1()
        {
            PlayerClass player = map.Player;
            gameDAL.InsertMap(map);
            map = gameDAL.LoadMap();
            Assert.IsTrue(map.Player.Equals(map.GameObjects[0]));
        }

        [Test]
        public void TestLoadMap2()
        {
            map.GameObjects[0] = null;
            gameDAL.InsertMap(map);
            map = gameDAL.LoadMap();
            Assert.IsTrue(map.Player.Equals(map.GameObjects[0]));
        }

        [Test]
        public void TestWorkTraps()
        {
            map.Player.X = 6;
            map.Player.Y = 6;
            map.GameObjects.Add(new MouseTrap() { X = 6, Y = 6, amountOfEffect = 5, effect = TrapEffect.Paralyze });
            map.CheckStepsIntoTrap();
            Assert.That(map.Player.LightnessTime < 0);
        }

        [Test]
        public void TestWorkBenefits()
        {
            map.Player.X = 6;
            map.Player.Y = 6;
            map.Player.HP = 40;
            map.GameObjects.Add(new Pineapple() { X = 6, Y = 6, HealthBoost = 30 });
            map.PlayerGiveHealthBoost();
            Assert.That(map.Player.HP > 40);
        }

        [Test]
        public void TestWorkObstacles()
        {
            map.Player.X = 6;
            map.Player.Y = 6;
            map.Player.HP = 10;
            map.GameObjects.Add(new Bush() { X = 6, Y = 6, Damage = 5});
            map.PlayerGiveDamage();
            Assert.That(map.Player.HP < 10);
        }
    }
} 