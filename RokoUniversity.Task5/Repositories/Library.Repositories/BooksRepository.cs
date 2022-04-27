using Dapper;
using Library.Dto;
using Library.Entities;
using Library.IRepositores;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Library.Repositories
{
    public class BooksRepository : IBooksRepository
    {
        private readonly ILogger<NotesRepository> _logger;
        private readonly DBOptions _dBOptions;

        public BooksRepository(ILogger<NotesRepository> logger, DBOptions dBOptions)
        {
            _logger = logger;
            _dBOptions = dBOptions;
        }
        public int InsertBook(BookDto book)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "INSERT INTO [dbo].[Books] (NotesID, Publisher, ISBN) VALUES (@id, @publisher, @isbn); SELECT SCOPE_IDENTITY();";
                return (int)(db.Query<decimal>(query, book).First());
            }
        }
        public List<int> CheckUniqueBook(string title, int yearOfPublication, List<AuthorDto> authors)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT BookID " +
                $"FROM [dbo].[Books] as b INNER JOIN [dbo].[Notes] as n ON b.NotesID = n.ID " +
                $"WHERE n.Title = N'{title}' AND n.YearOfPublication = {yearOfPublication}";
                return db.Query<int>(query).ToList();
            }
        }
        public bool CheckUniqueISBN(string ISBN)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT * " +
                    $"FROM [dbo].[Books] " +
                    $"WHERE ISBN = N'{ISBN}'";
                var result = db.Query(query).ToList();
                return result.Count == 0;
            }
        }

        public List<BookDto> FindBookByTitle(string title)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT BookID, NotesID as ID, Publisher, ISBN, n.YearOfPublication, n.ID, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication" +
                    $" FROM [dbo].Books as b JOIN(SELECT * FROM [dbo].[Notes] WHERE Title LIKE N'%{title}%') as n ON n.ID = b.NotesID ";
                return db.Query<BookDto>(query).ToList();
            }
        }

        public List<BookDto> FindBooksByAuthor(int authorID)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT b.BookID, NotesID as ID, Publisher, ISBN, n.YearOfPublication, n.ID, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication " +
                    $"FROM [dbo].[BooksToAuthors] as ba " +
                    $"LEFT JOIN [dbo].Books as b ON b.BookID = ba.BookID " +
                    $"INNER JOIN [dbo].Notes as n ON n.ID = b.NotesID " +
                    $"WHERE AuthorID = {authorID}";
                return db.Query<BookDto>(query).ToList();
            }
        }

        public Dictionary<string, List<BookDto>> OutputByPublisher(string pubBegins)
        {
            List<string> publishers;
            var resDc = new Dictionary<string, List<BookDto>>();
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT Publisher FROM[dbo].[Books]" +
                        $"WHERE Publisher LIKE N'{pubBegins}%'";
                publishers = db.Query<string>(query).ToHashSet().ToList();

                foreach (var publisher in publishers)
                {
                    query = $"SELECT BookID, NotesID as ID, Publisher, ISBN, n.YearOfPublication, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication " +
                            $"FROM [dbo].[Books] as b INNER JOIN [dbo].[Notes] as n ON b.NotesID = n.ID WHERE b.Publisher = N'{publisher}'";
                    var books = db.Query<BookDto>(query).ToList();
                    if (books.Count != 0)
                    {
                        resDc.Add(publisher, books);
                    }
                }
            }
            return resDc;
        }

        public NotesDto ConcretizeBook(NotesDto note)
        {
            BookDto book = new BookDto
            {
                ID = note.ID,
                Description = note.Description,
                Title = note.Title,
                PageCount = note.PageCount,
                PlaceOfPublication = note.PlaceOfPublication,
                YearOfPublication = note.YearOfPublication,
                Type = note.Type,
            };
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT BookID, Publisher, ISBN FROM Books WHERE NotesID = {note.ID}";
                var temp = db.Query(query).ToList().First();
                book.Publisher = temp.Publisher.ToString();
                book.ISBN = temp.ISBN?.ToString();
                book.BookID = (int)temp.BookID;
            }
            return book;
        }

        public void UpdateBook(BookDto bookDto)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"UPDATE [dbo].Books " +
                    $"SET Publisher = @publisher, " +
                    $"ISBN = @isbn " +
                    $"WHERE NotesID = @ID;";
                db.Query(query, bookDto);
            }
        }
    }
}
