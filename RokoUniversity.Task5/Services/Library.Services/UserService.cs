using AutoMapper;
using Library.Entities;
using Library.IRepositores;
using Library.IServices;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace Library.Services
{
    public class UserService : IUserService
    {
        private readonly ILogger<UserService> _logger;
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UserService(ILogger<UserService> logger, IMapper mapper, IUserRepository userRepository)
        {
            _logger = logger;
            _mapper = mapper;
            _userRepository = userRepository;
        }

        public User GetUser(string login)
        {
            return _userRepository.GetUser(login);
        }

        public User GetUser(int id)
        {
            return _userRepository.GetUser(id);
        }

        public List<User> GetUsers()
        {
            return _userRepository.GetUsers(); 
        }

        public bool LoginUser(User user)
        {
            return _userRepository.LoginUser(user);
        }

        public void UpdateUser(User user)
        {
            _userRepository.UpdateUser(user);
        }
    }
}
