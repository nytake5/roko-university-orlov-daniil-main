using System.ComponentModel.DataAnnotations;

namespace Library.UI.Web.Models
{
    public class AuthorView
    {
        public int AuthorId { get; set; }

        [StringLength(300)]
        [Required]
        public string FirstName { get; set; }

        [StringLength(300)]
        [Required]
        public string LastName { get; set; }

        public string Name => $"{LastName} {FirstName[0]}.";

        public override bool Equals(object other)
        {
            var author = other as AuthorView;
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
