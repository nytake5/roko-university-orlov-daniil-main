using System.Text.RegularExpressions;

namespace Library.Entities
{
    public static class StringHelper
    {
        public static bool ConsistOnly(this string value)
        {
            return (Regex.IsMatch(value, @"^([a-zA-Z0-9-]+\b( )?)+$") ^ Regex.IsMatch(value, @"^([а-яёА-ЯЁ-]+\b( )?)+$"));
        }
    }
}
