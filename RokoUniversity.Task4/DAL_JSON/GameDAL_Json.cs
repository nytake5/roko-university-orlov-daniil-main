using Entity_Res;
using Entity_Res.GameObjects;
using Entity_Res.GameObjects.Benefits;
using Entity_Res.GameObjects.Benefits.BenefitsBoost;
using Entity_Res.GameObjects.Monsters;
using Entity_Res.GameObjects.Obstacles;
using Entity_Res.GameObjects.Traps;
using DAL_Interface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace DAL_JSON
{
    public class GameDAL_Json : IGameDAL_Json
    {
        public int InsertMap(Map map)
        {
            IEnumerable<GameObject> gameObjects;
            JsonSerializerSettings jsonSerializerSettings;
            GenerateSetting(out jsonSerializerSettings);
            gameObjects = map.GameObjects.AsEnumerable();
            JsonConvert.DefaultSettings = () => new JsonSerializerSettings()
            {
                Formatting = Formatting.Indented,
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };
            string json = JsonConvert.SerializeObject(map, jsonSerializerSettings);
            string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "source.json");
            File.WriteAllText(path, json);
            return 0;
        }
        private static void GenerateSetting(out JsonSerializerSettings jsonSerializerSettings)
        {
            KnownTypesBinder knownTypesBinder = GenerateKnownTypes();
            jsonSerializerSettings = new JsonSerializerSettings()
            {
                TypeNameHandling = TypeNameHandling.Objects,
                SerializationBinder = knownTypesBinder,
            };
        }

        private static KnownTypesBinder GenerateKnownTypes()
        {
            return new KnownTypesBinder()
            {
                KnownTypes = new List<Type> { typeof(Apple), typeof(Cherry), typeof(Pineapple),
                                               typeof(Bear), typeof(Wolf), typeof(Fox),
                                                typeof(Bush), typeof(Stone), typeof(PlayerClass),
                                                 typeof(Map), typeof(Raspberry), typeof(Blueberry),
                                                  typeof(MouseTrap), typeof(Pitfall),}
            };
        }
            
        public Map LoadMap()
        {
            string pathMap = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "source.json");
            JsonSerializerSettings jsonSerializerSettings;
            GenerateSetting(out jsonSerializerSettings);
            JsonConvert.DefaultSettings = () => new JsonSerializerSettings()
            {
                Formatting = Formatting.Indented,
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };
            string json = File.ReadAllText(pathMap);
            Map map = (Map)JsonConvert.DeserializeObject(json, jsonSerializerSettings);
            map.Player.Map = map;
            map.GameObjects[0] = map.Player;
            foreach (var item in map.GameObjects)
            {
                var movableObj = item as MovableObject;
                if (movableObj != null)
                {
                    movableObj.Map = map;
                }
            }
            return map;
        }
    }
}
