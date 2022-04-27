using Dapper;
using Library.Entities;
using Library.IRepositores;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Library.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ILogger<UserRepository> _logger;
        private readonly DBOptions _dBOptions;

        public UserRepository(ILogger<UserRepository> logger, DBOptions dBOptions)
        {
            _logger = logger;
            _dBOptions = dBOptions;
        }

        public User GetUser(string login)
        {
            var query = "SELECT UserID, Name, Password, Role FROM Users WHERE Name = @name;";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.Query<User>(query, new { name = login}).ToList().First();
            }
        }

        public User GetUser(int userID)
        {
            var query = "SELECT UserID, Name, Password, Role FROM Users WHERE UserID = @id;";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.Query<User>(query, new { id = userID }).ToList().First();
            }
        }

        public List<User> GetUsers()
        {
            var query = "SELECT UserID, Name, Password, Role FROM Users;";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {   
                return db.Query<User>(query).ToList();
            }
        }

        public bool LoginUser(User user)
        {
            var query = "SELECT Name, Password, Role FROM Users WHERE Name = @name AND Password = @password;";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var res = db.Query<User>(query, new { name = user.Name, password = user.Password}).ToList().Count;
                if (res == 0)
                {
                    return false;
                }
            }
            return true;
        }

        public void UpdateUser(User user)
        {
            var query = "UPDATE [dbo].Users " +
                "SET Role = @role  WHERE UserID = @userID ";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                db.Query<User>(query, user).ToList();
            }
        }
    }
}
