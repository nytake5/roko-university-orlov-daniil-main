using System.ComponentModel.DataAnnotations;

namespace Library.UI.WebAPI .Models
{
    public class LoginModel
    {
        public int UserID { get; set; }

        [Required(ErrorMessage = "Login can't be empty")]
        [RegularExpression(@"^[a-zA-Z]([a-zA-Z0-9]|_?)+[a-zA-Z0-9]$")]
        public string Login { get; set; }

        [Required(ErrorMessage = "Password can't be empty")]
        [MinLength(3)]
        [DataType(DataType.Password)]      
        public string Password { get; set; }

        public string Role { get; set; }
    }
}
