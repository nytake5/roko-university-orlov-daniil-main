using System;
using System.Security.Cryptography;
using System.Text;

namespace Library.Entities
{
    public static class SHA512Helper
    {
        private static readonly string salt = "MyUniqueSalt";
        public static string GetSHA512Code(this string value)
        {
            using (SHA512 crypt = new SHA512Managed())
            {
                return Convert.ToBase64String(crypt.ComputeHash(Encoding.UTF8.GetBytes(value + salt)));
            }
        }
    }
}
