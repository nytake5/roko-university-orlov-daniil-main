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
    public class NotesRepository : INotesRepository
    {
        private readonly ILogger<NotesRepository> _logger;
        private readonly DBOptions _dBOptions;
        private readonly IBooksRepository _booksRepository;
        private readonly INewspapersRepository _newspapersRepository;
        private readonly IPatentsRepository _patentsRepository;

        public NotesRepository(ILogger<NotesRepository> logger, DBOptions dBOptions,
            IBooksRepository booksRepository, INewspapersRepository newspapersRepository, IPatentsRepository patentsRepository)
        {
            _logger = logger;
            _dBOptions = dBOptions;
            CheckSqlConnection();
            _booksRepository = booksRepository;
            _newspapersRepository = newspapersRepository;
            _patentsRepository = patentsRepository;
        }

        private void CheckSqlConnection()
        {
            try
            {
                using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
                {
                    db.Open();
                }
            }
            catch (SqlException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
            }
        }

        public int InsertNotes(NotesDto notes)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "INSERT INTO [dbo].[Notes] (Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication) " +
                    "VALUES (@type, @title, @description, @pageCount, @placeOfpublication, @yearOfPublication); SELECT SCOPE_IDENTITY();";
                return (int)(db.Query<decimal>(query, notes).First());
            }
        }

        public List<NotesDto> GroupByYearOfPublication()
        {
            List<int> years;
            List<NotesDto> res;
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT YearOfPublication FROM [dbo].[Notes]" +
                        $"GROUP BY YearOfPublication";
                years = db.Query<int>(query).ToHashSet().ToList();

                DataTable dt = new DataTable();
                dt.Columns.Add("EntityID");
                foreach (var year in years)
                {
                    dt.Rows.Add(year);
                }

                res = db.Query<NotesDto>("[GetNotesByYears]",
                        new { ids = dt.AsTableValuedParameter("dtIntEntity") },
                        commandType: CommandType.StoredProcedure).ToList();
            }
            return ConcretizeNotes(res);
        }

        public bool RemoveNotes(int notesID)
        {
            int delCount = 0;
            using (SqlConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var command = new SqlCommand($"DELETE FROM [dbo].Notes WHERE ID = {notesID}", db);
                db.Open();
                delCount = (int)command.ExecuteNonQuery();
            }
            return delCount != 0;
        }

        public List<NotesDto> SortByDate(bool descending = false)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                string query;
                if (descending)
                {
                    query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication FROM [dbo].Notes " +
                        $"ORDER BY YearOfPublication DESC";
                }
                else
                {
                    query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication FROM [dbo].Notes " +
                        $"ORDER BY YearOfPublication";
                }
                var notes = db.Query<NotesDto>(query).ToList();
                return ConcretizeNotes(notes);
            }
        }

        private List<NotesDto> ConcretizeNotes(IEnumerable<NotesDto> notes)
        {
            var resNotes = new List<NotesDto>();
            foreach (var note in notes)
            {
                switch (note.Type)
                {
                    case NotesType.Book:
                        resNotes.Add(_booksRepository.ConcretizeBook(note));
                        break;
                    case NotesType.Newspaper:
                        resNotes.Add(_newspapersRepository.ConcretizeNewspaper(note));
                        break;
                    case NotesType.Patent:
                        resNotes.Add(_patentsRepository.ConcretizePatent(note));
                        break;
                }
            }
            return resNotes;
        }

        public List<NotesDto> GetNotes()
        {
            List<NotesDto> notes = new List<NotesDto>();
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication FROM [dbo].Notes ";
                notes = db.Query<NotesDto>(query).ToList();
            }
            return ConcretizeNotes(notes);
        }

        public List<NotesDto> GetNotesSkipTake(int recSkip, int pageSize)
        {
            List<NotesDto> notes = new List<NotesDto>();
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication FROM [dbo].Notes " +
                    $"ORDER BY ID " + 
                    $"OFFSET @skip ROWS " +
                    $"FETCH NEXT @limit ROWS ONLY;";
                notes = db.Query<NotesDto>(query, new { skip = recSkip, limit = pageSize}).ToList();
            }
            return ConcretizeNotes(notes);
        }

        public int GetNotesCount()
        {
            var query = "SELECT count(*) FROM [dbo].Notes";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.QuerySingle<int>(query);
            }
        }

        public NotesDto GetNote(int id)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication FROM [dbo].Notes" +
                    $" WHERE ID = {id};";
                var note = db.QueryAsync<NotesDto>(query);
                return ConcretizeNotes(note.Result).First();
            }
        }

        public void UpdateNote(NotesDto note)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"UPDATE [dbo].Notes " +
                    $"SET Title = N'{note.Title}', " +
                    $"Description = N'{note.Description}', " +
                    $"PageCount = {note.PageCount}, " +
                    $"PlaceOfPublication = N'{note.PlaceOfPublication}', " +
                    $"YearOfPublication = {note.YearOfPublication}" +
                    $"WHERE ID = {note.ID}";
                db.Query(query);
            }
        }

        public List<NotesDto> FindByTitleSkipTake(string title, int recSkip, int pageSize)
        {
            List<NotesDto> notes = new List<NotesDto>();
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication " +
                    $"FROM [dbo].Notes " +
                    $"WHERE Title LIKE N'%{title}%' " + 
                    $"ORDER BY ID " +
                    $"OFFSET @skip ROWS " +
                    $"FETCH NEXT @limit ROWS ONLY;";
                notes = db.Query<NotesDto>(query, new {  skip = recSkip, limit = pageSize }).ToList();
            }
            return ConcretizeNotes(notes);
        }
    }
}
