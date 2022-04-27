using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.GameObjects.Benefits.BenefitsBoost;
using Entity_Res.GameObjects.Monsters;
using Entity_Res.GameObjects.Obstacles;
using Entity_Res.GameObjects.Traps;
using DAL_Interface;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace DAL
{
    public class GameDAL : IGameDAL
    {
        private readonly string _connectionString;

        public GameDAL(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void InsertStatisticElem(string username, int speedOfPassage, int difficultylvl, int mapID)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("INSERT [BestPassage] (Username, Result, DifficultyLevel, DateOfPassage, MapID) " +
                    "Values (@username, @res, @difflvl, @date, @mapID)", connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@res", speedOfPassage);
                command.Parameters.AddWithValue("@difflvl", difficultylvl);
                command.Parameters.AddWithValue("@date", (SqlDateTime)DateTime.Now);
                command.Parameters.AddWithValue("@mapID", mapID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public List<List<StatisticElem>> LoadListStatisticElem()
        {
            List<List<StatisticElem>> ListElems = new List<List<StatisticElem>>();
            for (int i = 0; i < 7; i++)
            {
                ListElems.Add(new List<StatisticElem>());
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand($"SELECT TOP 10 * FROM [dbo].BestPassage WHERE DifficultyLevel = {i + 1} ORDER BY Result", connection);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListElems[i].Add(new StatisticElem
                            { 
                                username = reader["UserName"].ToString(),
                                date = (DateTime)reader["DateOfPassage"],
                                DifficultyLvl = (int)reader["DifficultyLevel"],
                                speedOfPassage = (int)reader["Result"],
                                MapID = (int)reader["MapID"]
                            });
                        }
                    }
                }
            }
            return ListElems;
        }
        public void InsertGameLevel(Map map, int difficultyLevel)
        {
            int mapID = InsertMap(map);
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("INSERT [GameLevels] (DifficultyLevel, MapID) Values (@diffLvl, @mapID); SELECT SCOPE_IDENTITY();", connection);
                command.Parameters.AddWithValue("@diffLvl", difficultyLevel);
                command.Parameters.AddWithValue("@mapID", mapID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
        public Map LoadGameLevel(int difficultyLevel)
        {
            int mapID = -1;
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].GameLevels WHERE DifficultyLevel = {difficultyLevel};", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        mapID = (int)reader["MapID"];
                    }
                }
            }
            if (mapID == -1)
            {
                return new Map();
            }
            return LoadMap(mapID);
        }

        public void InsertPlayerSaves(string username, Map map, int difficultylvl, int speedOfPassage)
        {
            int mapID = InsertMap(map);
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"INSERT [PlayerSaves] (UserName, MapID, DateOfPassage, DifficultyLevel, SpeedOfPassage) Values (@username, @mapID, @date, @difflvl, @speed);", connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@date", (SqlDateTime)DateTime.Now);
                command.Parameters.AddWithValue("@mapID", mapID);
                command.Parameters.AddWithValue("@difflvl", difficultylvl);
                command.Parameters.AddWithValue("@speed", speedOfPassage);
                
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public List<PlayerSaves> LoadPlayerSaves(string username)
        {
            List<PlayerSaves> res = new List<PlayerSaves>();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].PlayerSaves WHERE UserName = N'{username}';", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        res.Add(new PlayerSaves() 
                        { 
                            username = username,
                            date = (DateTime)reader["DateOfPassage"],  
                            difficultyLvl = (int)reader["DifficultyLevel"],
                            speedOfPassage = (int)reader["SpeedOfPassage"],
                            mapID = (int)reader["MapID"]
                        });
                    }
                }
            }
            return res;
        }

        public int InsertMap(Map map)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("INSERT [MapM] (Width, Height) Values (@width, @height); SELECT SCOPE_IDENTITY();", connection);
                command.Parameters.AddWithValue("@width", map.Width);
                command.Parameters.AddWithValue("@height", map.Height);
                connection.Open();
                int mapID = (int)(decimal)command.ExecuteScalar();
                List<MovableObject> movables;
                List<BenefitObject> benefits;
                List<TrapObject> traps;
                List<GameObject> others; 
                FilterGameObject(map.GameObjects, out movables, out benefits, out traps, out others);
                InsertMovableObject(movables, mapID);
                InsertBenefit(benefits, mapID);
                InsertTraps(traps, mapID);
                InsertObstacles(others, mapID);
                return mapID;
            }
        }

        private void InsertObstacles(List<GameObject> others, int mapID)
        {
            foreach (var obstacles in others)
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand("INSERT [Obstacles] (Type, X, Y, Damage, MapID) " +
                        "Values (@type, @x, @y, @damage, @mapId);", connection);

                    switch (obstacles.GetType().Name)
                    {
                        case "Bush":
                            command.Parameters.AddWithValue("@type", "Bush");
                            command.Parameters.AddWithValue("@damage", (obstacles as Bush).Damage);
                            break;
                        case "Stone":
                            command.Parameters.AddWithValue("@type", "Stone");
                            command.Parameters.AddWithValue("@damage", DBNull.Value);
                            break;
                        default:
                            break;
                    }
                    command.Parameters.AddWithValue("@x", obstacles.X);
                    command.Parameters.AddWithValue("@y", obstacles.Y);
                    command.Parameters.AddWithValue("@mapId", mapID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void InsertTraps(List<TrapObject> traps, int mapID)
        {
            foreach (var trap in traps)
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand("INSERT [Traps] (Type, X, Y, Triggered, AmountOfEffect, Effect, MapID) " +
                        "Values (@type, @x, @y, @triggered, @amountOfEffect, @effect, @mapId);", connection);

                    switch (trap.GetType().Name)
                    {
                        case "MouseTrap":
                            command.Parameters.AddWithValue("@type", "MouseTrap");
                            break;
                        case "Pitfall":
                            command.Parameters.AddWithValue("@type", "Pitfall");
                            break;
                        default:
                            break;
                    }
                    command.Parameters.AddWithValue("@x", trap.X);
                    command.Parameters.AddWithValue("@y", trap.Y);
                    command.Parameters.AddWithValue("@triggered", trap.Triggered);
                    command.Parameters.AddWithValue("@amountOfEffect", trap.amountOfEffect);
                    command.Parameters.AddWithValue("@effect", (int)trap.effect);
                    command.Parameters.AddWithValue("@mapId", mapID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void InsertBenefit(List<BenefitObject> benefits, int mapID)
        {
            foreach (var benefit in benefits)
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand("INSERT [Benefits] (Type, X, Y, AmountOfEffect, Effect, MapID) " +
                        "Values (@type, @x, @y, @amountOfEffect, @effect, @mapId);", connection);
                    BenefitBoost boost = benefit as BenefitBoost;
                    if (boost != null)
                    {
                        switch (boost.GetType().Name)
                        {
                            case "Raspberry":
                                command.Parameters.AddWithValue("@type", "Raspberry");
                                break;
                            case "Blueberry":
                                command.Parameters.AddWithValue("@type", "Blueberry");
                                break;
                            default:
                                break;
                        }
                        command.Parameters.AddWithValue("@amountOfEffect", boost.Boost);
                        command.Parameters.AddWithValue("@effect", (int)boost.Operation);
                    }
                    else
                    {
                        switch (benefit.GetType().Name)
                        {
                            case "Apple":
                                command.Parameters.AddWithValue("@type", "Apple");
                                command.Parameters.AddWithValue("@amountOfEffect", benefit.HealthBoost);
                                break;
                            case "Cherry":
                                command.Parameters.AddWithValue("@type", "Cherry");
                                command.Parameters.AddWithValue("@amountOfEffect", benefit.HealthBoost);
                                break;
                            case "Pineapple":
                                command.Parameters.AddWithValue("@type", "Pineapple");
                                command.Parameters.AddWithValue("@amountOfEffect", benefit.HealthBoost);
                                break;
                            default:
                                break;
                        }
                        command.Parameters.AddWithValue("@effect", DBNull.Value);
                    }
                    command.Parameters.AddWithValue("@x", benefit.X);
                    command.Parameters.AddWithValue("@y", benefit.Y);
                    command.Parameters.AddWithValue("@mapId", mapID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void InsertMovableObject(List<MovableObject> movableObjects, int mapID)
        {
            foreach (var movable in movableObjects)
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand command = new SqlCommand("INSERT [MovableObject] (Type, X, Y, HP, Damage, Lightness, MapID) " +
                        "Values (@type, @x, @y, @hp, @damage, @lightness, @mapId);", connection);
                    if (movable is PlayerClass)
                    {
                        command.Parameters.AddWithValue("@type", "PlayerClass");
                        command.Parameters.AddWithValue("@damage", DBNull.Value);
                    }
                    else
                    {
                        MonsterObject monster = movable as MonsterObject;
                        switch (monster.GetType().Name)
                        {
                            case "Fox":
                                command.Parameters.AddWithValue("@type", "Fox");
                                break;
                            case "Bear":
                                command.Parameters.AddWithValue("@type", "Bear");
                                break;
                            case "Wolf":
                                command.Parameters.AddWithValue("@type", "Wolf");
                                break;
                            default:
                                break;
                        }
                        command.Parameters.AddWithValue("@damage", monster.Damage);
                    }
                    command.Parameters.AddWithValue("@hp", movable.HP);
                    command.Parameters.AddWithValue("@lightness", movable.LightnessTime);
                    command.Parameters.AddWithValue("@x", movable.X);
                    command.Parameters.AddWithValue("@y", movable.Y);
                    command.Parameters.AddWithValue("@mapId", mapID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void FilterGameObject (List<GameObject> gameObjects, out List<MovableObject> movables, 
                                                    out List<BenefitObject> benefits, out List<TrapObject> traps, out List<GameObject> others)
        {
            movables = new List<MovableObject>();
            benefits = new List<BenefitObject>();
            traps = new List<TrapObject>();
            others = new List<GameObject>();
            foreach (var item in gameObjects)
            {
                MovableObject movable = item as MovableObject;
                BenefitObject benefit = item as BenefitObject;
                TrapObject trap = item as TrapObject;
                if (movable != null)
                {
                    movables.Add(movable);
                }
                else if (benefit != null)
                {
                    benefits.Add(benefit);
                }
                else if (trap != null)
                {
                    traps.Add(trap);
                }
                else
                {
                    others.Add(item);
                }
            }
        }

        public Map LoadMap(int mapID)
        {
            Map map = new Map();
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].MapM WHERE MapID = {mapID}", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        map.Width = (int)reader["Width"];
                        map.Height = (int)reader["Height"];
                        map.ID = (int)reader["MapID"];
                    }
                }
            }
            map.GameObjects = new List<GameObject>();
            LoadMovableObj(mapID, map);
            LoadBenefits(mapID, map);
            LoadTraps(mapID, map);
            LoadObstacles(mapID, map);
            return map;
        }

        private void LoadMovableObj(int mapID, Map map)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].MovableObject WHERE MapID = {mapID}", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    MonsterObject monster = null;
                    while (reader.Read())
                    {
                        switch (reader["Type"].ToString())
                        {
                            case "PlayerClass":
                                PlayerClass player = new PlayerClass();
                                player.X = (int)reader["X"];
                                player.Y = (int)reader["Y"];
                                player.HP = (int)reader["HP"];
                                player.LightnessTime = (int)reader["Lightness"];
                                player.Map = map;
                                map.Player = player;
                                map.GameObjects.Add(player);
                                break;
                            case "Bear":
                                monster = new Bear();
                                break;
                            case "Fox":
                                monster = new Fox();
                                break;
                            case "Wolf":
                                monster = new Wolf();
                                break;
                        }
                        if (monster != null)
                        {
                            monster.X = (int)reader["X"];
                            monster.Y = (int)reader["Y"];
                            monster.Damage = (int)reader["Damage"];
                            monster.HP = (int)reader["HP"];
                            monster.LightnessTime = (int)reader["Lightness"];
                            monster.Map = map;
                            map.GameObjects.Add(monster);
                        }
                    }
                }
            }
        }

        private void LoadBenefits(int mapID, Map map)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].Benefits WHERE MapID = {mapID}", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BenefitObject benefit = null;
                        switch (reader["Type"].ToString())
                        {
                            case "Apple":
                                benefit = new Apple();
                                benefit.HealthBoost = (int)reader["AmountOfEffect"];
                                break;
                            case "Pineapple":
                                benefit = new Pineapple();
                                benefit.HealthBoost = (int)reader["AmountOfEffect"];
                                break;
                            case "Cherry":
                                benefit = new Cherry();
                                benefit.HealthBoost = (int)reader["AmountOfEffect"];
                                break;
                            case "Blueberry":
                                Blueberry blueberry = new Blueberry();
                                blueberry.X = (int)reader["X"];
                                blueberry.Y = (int)reader["Y"];
                                blueberry.Boost = (int)reader["AmountOfEffect"];
                                blueberry.Operation = (Impact)(byte)reader["Effect"];
                                map.GameObjects.Add(blueberry);
                                break;
                            case "Raspberry":
                                Raspberry raspberry = new Raspberry();
                                raspberry.X = (int)reader["X"];
                                raspberry.Y = (int)reader["Y"];
                                raspberry.Boost = (int)reader["AmountOfEffect"];
                                raspberry.Operation = (Impact)(byte)reader["Effect"];
                                map.GameObjects.Add(raspberry);
                                break;
                            default:
                                break;
                        }
                        if (benefit != null)
                        {
                            benefit.X = (int)reader["X"];
                            benefit.Y = (int)reader["Y"];
                            map.GameObjects.Add(benefit);
                        }
                    }
                }
            }
        }

        private void LoadTraps(int mapID, Map map)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].Traps WHERE MapID = {mapID}", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    TrapObject trap = null;
                    while (reader.Read())
                    {
                        switch (reader["Type"].ToString())
                        {
                            case "MouseTrap":
                                trap = new MouseTrap();
                                break;
                            case "Pitfall":
                                trap = new Pitfall();
                                break;
                            default:
                                break;
                        }
                        if (trap != null)
                        {
                            trap.X = (int)reader["X"];
                            trap.Y = (int)reader["Y"];
                            trap.Triggered = (bool)reader["Triggered"];
                            trap.effect = (TrapEffect)(byte)reader["Effect"];
                            trap.amountOfEffect = (int)reader["AmountOfEffect"];
                            map.GameObjects.Add(trap);
                        }
                    }
                }
            }
        }

        private void LoadObstacles(int mapID, Map map)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            { 
                SqlCommand command = new SqlCommand($"SELECT * FROM [dbo].Obstacles WHERE MapID = {mapID}", connection);
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        switch (reader["Type"].ToString())
                        {
                            case "Stone":
                                Stone stone = new Stone();
                                stone.X = (int)reader["X"];
                                stone.Y = (int)reader["Y"];
                                map.GameObjects.Add(stone);
                                break;
                            case "Bush":
                                Bush bush = new Bush();
                                bush.X = (int)reader["X"];
                                bush.Y = (int)reader["Y"];
                                bush.Damage = (int)reader["Damage"];
                                map.GameObjects.Add(bush);
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        }
    }
}
