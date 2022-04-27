using Library.Entities;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Library.UI.Web.Models
{
    public class NoteView
    {
        public int ID { get; set; }

        [DisplayName("Title")]
        [Required]
        [StringLength(300)]
        public string Title { get; set; }
        
        [DisplayName("Description")]
        [Required]
        [StringLength(2000)]
        public string Description { get; set; }

        [DisplayName("Page count")]
        [Required]
        public int PageCount { get; set; }

        [DisplayName("Place of publication")]
        [Required]
        public string PlaceOfPublication { get; set; }

        [DisplayName("Identity")]
        public virtual string Identity() => null;

        [DisplayName("Info")]
        public virtual string GetInfo() => null;

        public virtual NotesType GetNotesType()
        {
            return (default);
        }
    }
}
