using Library.Dto;
using Library.IRepositores;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using System.Linq;
using Library.Entities;

namespace Library.Repositories
{
    public class AuthorsRepository : IAuthorsRepository
    {
        private readonly ILogger<AuthorsRepository> _logger;
        private readonly DBOptions _dBOptions;
        public AuthorsRepository(ILogger<AuthorsRepository> logger, DBOptions dBOptions)
        {
            _logger = logger;
            _dBOptions = dBOptions;
        }
        public List<AuthorDto> GetAuthors()
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "SELECT * FROM Authors";
                return db.Query<AuthorDto>(query).ToList();
            }
        }

        public List<AuthorDto> GetAuthorsByBooksIds(IEnumerable<int> ids)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EntityID");
            foreach (var id in ids)
            {
                dt.Rows.Add(id);
            }

            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.Query<AuthorDto>("[GetAuthorsByBooksID]",
                    new { ids = dt.AsTableValuedParameter("[dtIntEntity]") },
                    commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public List<AuthorDto> GetAuthorsByPatentIds(IEnumerable<int> ids)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EntityID");
            foreach (var id in ids)
            {
                dt.Rows.Add(id);
            }

            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.Query<AuthorDto>("GetAuthorsByPatentID",
                    new { ids = dt.AsTableValuedParameter("dtIntEntity") },
                    commandType: CommandType.StoredProcedure).ToList();
            }
        }


        public int InsertAuthor(AuthorDto author)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "INSERT INTO Authors (FirstName, LastName) VALUES (@firstname, @lastname); SELECT SCOPE_IDENTITY();";
                return (int)(db.Query<decimal>(query, author).First());
            }
        }

        public void InsertBookToAuthor(int bookID, List<int> authorsID)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                foreach (var id in authorsID)
                {
                    var query = $"INSERT INTO BooksToAuthors (BookID, AuthorID) VALUES ({bookID}, {id});";
                    db.Query(query);
                }
            }
        }

        public void InsertPatentToAuthor(int patentID, List<int> authorsID)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                foreach (var id in authorsID)
                {
                    var query = $"INSERT INTO PatentsToAuthors (PatentID, AuthorID) VALUES ({patentID}, {id});";
                    db.Query(query);
                }
            }
        }

        public int FindAuthorByName(AuthorDto author)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT AuthorID FROM [dbo].Authors WHERE FirstName = N'{author.FirstName}' AND LastName = N'{author.LastName}'";
                var temp = (db.Query<decimal>(query, author));
                if (temp.Count() == 0)
                {
                    return -1;
                }
                return (int)temp.First();
            }
        }

        public bool CheckUniqueAuthors(List<AuthorDto> currAuthors, List<int> otherNotes, bool isBook)
        {
            List<AuthorDto> listAuthors;
            if (isBook)
            {
                listAuthors = GetAuthorsByBooksIds(otherNotes);
            }
            else
            {
                listAuthors = GetAuthorsByPatentIds(otherNotes);
            }
            var groups = listAuthors.GroupBy(x => x.ID);
            foreach (var authorsOfOneNote in groups)
            {
                if (authorsOfOneNote.Count() != currAuthors.Count)
                {
                    continue;
                }
                foreach (var authorOther in authorsOfOneNote)
                {
                    authorOther.ID = null;
                    authorOther.AuthorId = 0;
                }
                var intersect = authorsOfOneNote.Intersect(currAuthors);
                if (intersect.Count() == currAuthors.Count)
                {
                    return false;
                }
            }
            return true;
        }

        public void RemoveRelationshipBook(int BookID, List<int> deletedAuthorId)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EntityID");
            foreach (var id in deletedAuthorId)
            {
                dt.Rows.Add(id);
            }

            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                db.Query("RemoveRelationshipBooksToAuthors",
                    new { bookId = BookID, ids = dt.AsTableValuedParameter("dtIntEntity") },
                    commandType: CommandType.StoredProcedure);
            }
        }

        public void RemoveRelationshipPatent(int PatentID, List<int> deletedAuthorId)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("EntityID");
            foreach (var id in deletedAuthorId)
            {
                dt.Rows.Add(id);
            }

            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                db.Query("RemoveRelationshipPatentsToAuthors",
                    new { patentId = PatentID, ids = dt.AsTableValuedParameter("dtIntEntity") },
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
