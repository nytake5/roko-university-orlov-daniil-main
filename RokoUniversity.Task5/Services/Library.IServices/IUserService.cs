using Library.Entities;
using System.Collections.Generic;

namespace Library.IServices
{
    public interface IUserService
    {
        public User GetUser(string login);

        public bool LoginUser(User user);

        public void UpdateUser(User user);
        public List<User> GetUsers();
        User GetUser(int id);
    }
}
