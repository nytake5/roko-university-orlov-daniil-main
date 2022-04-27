using Library.Dto;
using Library.Entities;
using System.Collections.Generic;

namespace Library.IRepositores
{
    public interface IBooksRepository
    {
        List<BookDto> FindBookByTitle(string title);
        List<BookDto> FindBooksByAuthor(int authorID);
        Dictionary<string, List<BookDto>> OutputByPublisher(string pubBegins);
        List<int> CheckUniqueBook(string title, int yearOfPublication, List<AuthorDto> authors);
        bool CheckUniqueISBN(string ISBN);
        int InsertBook(BookDto book);
        NotesDto ConcretizeBook(NotesDto note);
        void UpdateBook(BookDto bookDto);
    }
}
