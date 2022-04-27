using System;

namespace Library.Dto
{   
    public class PatentDto : NotesDto
    {
        public int PatentID { get; set; }
        public DateTime DateOfApplicationSubmission { get; set; }
        public DateTime DateOfPublication { get; set; }
        public int Number { get; set; }
    }
}
