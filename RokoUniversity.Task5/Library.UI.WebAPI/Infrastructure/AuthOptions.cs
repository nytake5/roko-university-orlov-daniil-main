using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.UI.WebAPI.Infrastructure
{
    public class AuthOptions
    {
        public const string ISSUER = "MyLibraryService";
        public const string AUDIENCE = "MyReactLibraryClient";
        const string KEY = "mysupersecret_secretkey!123";
        public const int LIFETIME = 60;
        public static SymmetricSecurityKey GetSymmetricSecurityKey()
        {
            return new SymmetricSecurityKey(Encoding.ASCII.GetBytes(KEY));
        }
    }
}
