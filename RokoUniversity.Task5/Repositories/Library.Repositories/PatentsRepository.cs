using Dapper;
using Library.Dto;
using Library.IRepositores;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Library.Repositories
{
    public class PatentsRepository : IPatentsRepository
    {
        private readonly ILogger<NotesRepository> _logger;
        private readonly DBOptions _dBOptions;

        public PatentsRepository(ILogger<NotesRepository> logger, DBOptions dBOptions)
        {
            _logger = logger;
            _dBOptions = dBOptions;
        }

        public int InsertPatent(PatentDto patent)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "INSERT INTO [dbo].[Patents] (NotesID, DateOfPublication, Number, DateOfApplicationSubmission) VALUES (@id, @dateOfPublication, @number, @DateOfApplicationSubmission); SELECT SCOPE_IDENTITY();";
                return (int)(db.Query<decimal>(query, patent).First());
            }
        }

        public List<int> CheckUniquePatent(int number, string country)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT NotesID as ID " +
                    $"FROM [dbo].[Patents] as p INNER JOIN [dbo].[Notes] as n ON p.NotesID = n.ID " +
                    $"WHERE Number = {number} AND n.PlaceOfPublication = N'{country}';";
                return db.Query<int>(query).ToList();
            }
        }

        public List<PatentDto> FindPatentByTitle(string title)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT [PatentID], NotesID as ID, [DateOfPublication], [Number], [DateOfApplicationSubmission], n.ID, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication" +
                    $" FROM [dbo].Patents as b JOIN(SELECT * FROM [dbo].[Notes] WHERE Title LIKE N'%{title}%') as n ON n.ID = b.NotesID ";
                return db.Query<PatentDto>(query).ToList();
            }
        }

        public List<PatentDto> FindPatentsByInnovator(int authorID)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT p.[PatentID], NotesID as ID, [DateOfPublication], [Number], [DateOfApplicationSubmission], n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication " +
                    $"FROM [dbo].[PatentsToAuthors] as pa " +
                    $"LEFT JOIN [dbo].Patents as p ON p.PatentID = pa.PatentID " +
                    $"INNER JOIN [dbo].Notes as n ON n.ID = p.NotesID " +
                    $"WHERE AuthorID = {authorID}";
                return db.Query<PatentDto>(query).ToList();
            }
        }

        public NotesDto ConcretizePatent(NotesDto note)
        {
            PatentDto patent = new PatentDto
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
                var query = $"SELECT PatentID, DateOfPublication, Number, DateOfApplicationSubmission FROM Patents WHERE NotesID = {note.ID}";
                var temp = db.Query(query).ToList().First();
                patent.DateOfPublication = (DateTime)temp.DateOfPublication;
                patent.Number = (int)temp.Number;
                patent.DateOfApplicationSubmission = (DateTime)temp.DateOfApplicationSubmission;
                patent.PatentID = (int)temp.PatentID;
            }
            return patent;
        }

        public void UpdatePatent(PatentDto patentDto)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"UPDATE [dbo].Patents " +
                    $"SET DateOfPublication = @dateOfPublication, " +
                    $"Number = @number, " +
                    $"DateOfApplicationSubmission = @dateOfApplicationSubmission " +
                    $"WHERE NotesID = @ID";
                db.Query(query, patentDto);
            }
        }
    }
}
