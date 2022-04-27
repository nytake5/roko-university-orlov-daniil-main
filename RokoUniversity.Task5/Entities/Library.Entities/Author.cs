using System;

namespace Library.Entities
{
    public class Author
    {
        public int AuthorId { get; set; }
        private string _firstName;
        private string _lastName;
        public string FirstName 
        {
            get
            {
                return _firstName;
            }
            set
            {
                if (!ValidationFirstName(value))
                {
                    throw new ArgumentException("Something strange is entered instead of the FirstName");
                }
                _firstName = value;
            }
        }

        public string LastName 
        {
            get
            {
                return _lastName;
            }
            set
            {
                if (!ValidationLastName(value))
                {
                    throw new ArgumentException("Something strange is entered instead of the LastName");
                }
                _lastName = value;
            }
        }

        public override string ToString()
        {
            return $"{FirstName} {LastName}";
        }
        
        private static bool ValidationFirstName(string value)
        {
            if (value.Length == 0)
            {
                return false;
            }
            if (!value.ConsistOnly())
            {
                return false;
            }
            return !(value.Length > 50 || char.IsLower(value[0]) || value[0].Equals("-") || value[^1].Equals("-") 
                || (value[0].Equals("-") && char.IsLower(value[1])));
        }
        private static bool ValidationLastName(string value)
        {
            if (value.Length == 0)
            {
                return false;
            }
            if (!value.ConsistOnly())
            {
                return false;
            }   
            return !(value.Length > 200 || char.IsLower(value[0]) || value[0].Equals("-") || value[^1].Equals("-")
                || (value[0].Equals("-") && char.IsLower(value[1])));
        }

        public override bool Equals(object other)
        {
            var author = other as Author;
            if (author == null)
            {
                return false;
            }
            if (author.GetHashCode() != this.GetHashCode())
            {
                return false;
            }
            if (this.FirstName.Equals(author.FirstName) && this.LastName.Equals(author.LastName))
            {
                return true;
            }
            return false;
        }

        public override int GetHashCode()
        {
            return FirstName.GetHashCode() ^ LastName.GetHashCode();
        }
    }
}
