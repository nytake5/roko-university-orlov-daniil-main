using Library.Entities;
using System.Collections.Generic;

namespace Library.IRepositores
{
    public interface IUserRepository
    {
        List<User> GetUsers();
        User GetUser(string login);
        User GetUser(int userID);
        bool LoginUser(User user);
        void UpdateUser(User user);
    }
}
