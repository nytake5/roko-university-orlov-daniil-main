namespace Library.Dto
{
    public class BookDto : NotesDto
    {
        public int BookID { get; set; }
        public string Publisher { get; set; }
        public string? ISBN { get; set; }
    }
}
