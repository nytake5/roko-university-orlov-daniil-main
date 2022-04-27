using Library.Dto;
using Library.Entities;
using Library.IRepositores;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Library.FakeRepositories
{
    public class BooksRepository : IBooksRepository
    {
        List<NotesDto> notes;
        public BooksRepository(List<NotesDto> notes)
        {
            this.notes = notes;
        }
        public List<int> CheckUniqueBook(string title, int yearOfPublication, List<AuthorDto> authors)
        {
            var res = new List<int>();
            foreach (var note in notes)
            {
                var book = note as BookDto;
                if (book != null)
                {
                    if (book.Title.Equals(title) && book.YearOfPublication == yearOfPublication)
                    {
                        res.Add(book.ID);
                    }
                }
            }
            return res;
        }

        public bool CheckUniqueISBN(string ISBN)
        {
            foreach (var note in notes)
            {
                var book = note as BookDto;
                if (book != null)
                {
                    if (book.ISBN.Equals(ISBN))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public NotesDto ConcretizeBook(NotesDto note)
        {
            return note as BookDto;
        }

        public List<BookDto> FindBookByTitle(string title)
        {
            List<BookDto> res = new List<BookDto>();
            foreach (var note in notes)
            {
                var book = note as BookDto;
                if (book != null)
                {
                    if (book.Title.Equals(title))
                    {
                        res.Add(book);
                    }
                }
            }
            return res;
        }

        public List<BookDto> FindBooksByAuthor(int authorID)
        {
            return new List<BookDto>();
        }

        public int InsertBook(BookDto notes)
        {
            notes.ID = this.notes.Count;
            this.notes.Add(notes);
            return this.notes.Count - 1;
        }

        public Dictionary<string, List<BookDto>> OutputByPublisher(string pubBegins)
        {
            var resDc = new Dictionary<string, List<BookDto>>();
            foreach (var note in notes)
            {
                var book = note as BookDto;
                if (book != null)
                {
                    if (Regex.IsMatch(book.Publisher, $@"^{pubBegins}"))
                    {
                        if (resDc.ContainsKey(book.Publisher))
                        {
                            resDc[book.Publisher].Add(book);
                        }
                        else
                        {
                            resDc.Add(book.Publisher, new List<BookDto> { book });
                        }
                    }
                }
            }
            return resDc;
        }

        public void UpdateBook(BookDto bookDto)
        {
            throw new System.NotImplementedException();
        }
    }
}
