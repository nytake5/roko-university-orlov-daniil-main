using Library.Entities;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Library.UI.Web.Models
{
    public class NewspaperView : NoteView
    {

        [DisplayName("Publisher")]
        [Required]
        [StringLength(300)]
        public string Publisher { get; set; }

        [DisplayName("Year of publication")]
        [Required]
        public int YearOfPublication { get; set; }

        [DisplayName("Issue number")]
        [Required]
        public int? IssueNumber { get; set; }

        [StringLength(200)]
        [DataType(DataType.Text)]
        public string? ISSN { get; set; }

        [Required]
        public string Edition { get; set; }

        public override string GetInfo()
        {
                if (IssueNumber != null)
                {
                    return $"{Title} - №{IssueNumber}/{YearOfPublication}";
                }
                else
                {
                    return $"{Title} - {YearOfPublication}";
                }
        }

        [DisplayName("ISSN")]
        public override string Identity() => ISSN ?? "Noone";

        public string Editions() => $"{Title}/{Publisher}/{PlaceOfPublication}";

        public List<Newspaper> NewspapersWithOtherView { get; set; }

        public override NotesType GetNotesType()
        {
            return NotesType.Newspaper;
        }
    }
}
