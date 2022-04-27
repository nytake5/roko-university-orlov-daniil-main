namespace Library.Entities
{
    public class User
    {
        public int UserID { get; set; }
        public string Name { get; set; }

        private string _password;
        public string Password 
        {
            get 
            {
                return _password;
            }
            set
            {
                _password = value.GetSHA512Code();
            }
        }
        
        public string Role { get; set; }
    }
}
