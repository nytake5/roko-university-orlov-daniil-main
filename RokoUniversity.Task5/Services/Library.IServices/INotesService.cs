using Library.Entities;
using System.Collections.Generic;
 
namespace Library.IServices
{
    public interface INotesService
    {
        List<Notes> GetNotes();
        void InsertBook(Book book);
        void InsertPatent(Patent patent);
        void InsertNewspaper(Newspaper newspaper);
        bool RemoveNotes(int notesID);
        List<Notes> FindByTitle(string title);
        List<Notes> FindByTitleSkipTake(string title, int recSkip, int pageSize);
        List<Notes> SortByDate(bool descending = false);
        List<Book> FindBooksByAuthor(Author author);
        List<Patent> FindPatentsByInnovator(Author author);
        List<Notes> FindBooksAndPatentsByAuthor(Author author);
        Dictionary<string, List<Book>> OutputByPublisher(string pubBegins);
        Dictionary<int, List<Notes>> GroupByYearOfPublication();
        Notes GetNote(int id);
        List<Newspaper> FindNewspaperByTitleAndPublisher(string title, string publisher);
        List<Edition> GetNewpapersExistingEditions();
        void UpdateNote(Notes note);
        int Count();
        List<Notes> GetNotesSkipTake(int recSkip, int pageSize);
    }
}
