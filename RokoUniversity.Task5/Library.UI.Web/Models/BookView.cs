using Library.Entities;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Library.UI.Web.Models
{
    public class BookView : NoteView
    {
        [DisplayName("Publisher")]
        [Required]
        [DataType(DataType.Text)]
        [StringLength(300)]
        public string Publisher { get; set; }

        [DisplayName("Year of publication")]
        [Required]
        public int YearOfPublication { get; set; }

        [DataType(DataType.Text)]
        public string? ISBN { get; set; }

        public List<AuthorView> Authors { get; set; }

        public List<string> AuthorsName{ get; set; }

        [DisplayName("ISBN")]
        public override string Identity() => ISBN ?? "Noone";

        public override string GetInfo() => $"{AuthorsToString()} - {Title}({YearOfPublication})";

        public string AuthorsToString()
        {
            string res = ""; //I proceeded from the logic that with small operations string does not lose Stringbuilder
            foreach (var author in Authors)
            {
                if (author.Equals(Authors.Last()))
                {
                    res += author.Name;
                }
                else
                {
                    res += author.Name + ", ";
                }
            }
            return res;
        }

        public override NotesType GetNotesType() => NotesType.Book;
    }
}
