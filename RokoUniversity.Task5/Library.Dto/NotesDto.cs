using Library.Entities;
using System;

namespace Library.Dto
{
    public class NotesDto : IComparable<NotesDto>
    {
        public int ID { get; set; }
        public NotesType Type { get; set; }
        public string Title { get; set; }
        public int YearOfPublication { get; set; }
        public string Description { get; set; }
        public int PageCount { get; set; }
        public string PlaceOfPublication { get; set; }

        public int CompareTo(NotesDto other)
        {
            return other != null ? YearOfPublication.CompareTo(other.YearOfPublication) : 1;
        }
    }
}
 