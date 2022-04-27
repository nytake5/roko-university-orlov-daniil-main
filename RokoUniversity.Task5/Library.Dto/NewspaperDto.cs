namespace Library.Dto
{
    public class NewspaperDto : NotesDto
    {
        public int NewspaperId { get; set; }
        public string Publisher { get; set; }
        public int IssueNumber { get; set; }
        public string? ISSN { get; set; }
    }
}
