using DAL;
using DAL_Interface;
using DAL_JSON;
using System;

namespace Dependencies
{
    public static class Depend
    {
        private static string connectionString = @"Server=DESKTOP-CSH6GPU\SQLEXPRESS;Database=MyGame;Integrated Security=true;";
        private static IGameDAL _gameDAL;

        public static IGameDAL gameDALFull => _gameDAL ?? (new GameDAL(connectionString));

        private static IGameDAL_Json _gameDAL_json;
        public static IGameDAL_Json gameDAL_json => _gameDAL_json ?? (new GameDAL_Json());
    }
}
