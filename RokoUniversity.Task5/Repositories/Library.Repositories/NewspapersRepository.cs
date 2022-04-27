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
    public class NewspapersRepository : INewspapersRepository
    {
        private readonly ILogger<NotesRepository> _logger;
        private readonly DBOptions _dBOptions;

        public NewspapersRepository(ILogger<NotesRepository> logger, DBOptions dBOptions)
        {
            _logger = logger;
            _dBOptions = dBOptions;
        }
        public int InsertNewspaper(NewspaperDto newspaper)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = "INSERT INTO [dbo].[Newspapers] (NotesID, Publisher, ISSN, IssueNumber) VALUES (@id, @publisher, @issn, @issueNumber); SELECT SCOPE_IDENTITY();";
                return (int)(db.Query<decimal>(query, newspaper).First());
            }
        }
        public List<int> CheckUniqueNewspaper(string title, string publisher, int yearOfPublication)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT NotesID as ID " +
                    $"FROM [dbo].[Newspapers] as nw INNER JOIN [dbo].[Notes] as n ON nw.NotesID = n.ID " +
                    $"WHERE n.Title = N'{title}' AND n.YearOfPublication = {yearOfPublication} AND Publisher = N'{publisher}';";
                return db.Query<int>(query).ToList();
            }
        }
        public bool CheckUniqueISSN(string ISSN)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT * " +
                    $"FROM [dbo].[Newspapers] " +
                    $"WHERE ISSN = N'{ISSN}';";
                var result = db.Query(query).ToList();
                return result.Count == 0;
            }
        }

        public List<NewspaperDto> FindNewspaperByTitle(string title)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT NewspaperId, NotesID as ID, [Publisher], [ISSN], [IssueNumber], n.YearOfPublication, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication" +
                    $" FROM [dbo].Newspapers as b JOIN (SELECT * FROM [dbo].[Notes] WHERE Title LIKE N'%{title}%') as n ON n.ID = b.NotesID ";
                return db.Query<NewspaperDto>(query).ToList();
            }
        }

        public NotesDto ConcretizeNewspaper(NotesDto note)
        {
            NewspaperDto newspaper = new NewspaperDto
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
                var query = $"SELECT NewspaperID, Publisher, ISSN, IssueNumber FROM Newspapers WHERE NotesID = {note.ID}";
                var temp = db.Query(query).ToList().First();
                newspaper.Publisher = temp.Publisher.ToString();
                newspaper.ISSN = temp.ISSN?.ToString();
                newspaper.IssueNumber = (int)temp.IssueNumber;
                newspaper.NewspaperId = (int)temp.NewspaperID;
            }
            return newspaper;
        }

        public List<NewspaperDto> GetNewspaperByTitleAndPublisher(string title, string publisher)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"SELECT NewspaperId, NotesID as ID, [Publisher], [ISSN], [IssueNumber], n.YearOfPublication, n.Type, n.Title, n.Description, n.PageCount, n.PlaceOfPublication" +
                    $" FROM [dbo].Newspapers as nw JOIN (SELECT * FROM [dbo].[Notes] WHERE Title = N'{title}') as n ON n.ID = nw.NotesID WHERE Publisher = N'{publisher}' ORDER BY nw.IssueNumber DESC;";
                return db.Query<NewspaperDto>(query).ToList();
            }
        }

        public List<Edition> GetExistingEditions()
        {
            var query = "SELECT DISTINCT [Publisher], n.Title, n.PlaceOfPublication " +
                "FROM [dbo].Newspapers as nw JOIN [dbo].[Notes] as n ON n.ID = nw.NotesID;";
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                return db.Query<Edition>(query).ToList();
            }
        }

        public void UpdateNewspaper(NewspaperDto newspaperDto)
        {
            using (IDbConnection db = new SqlConnection(_dBOptions.ConnectionString))
            {
                var query = $"UPDATE [dbo].Newspapers " +
                    $"SET Publisher = @publisher, " +
                    $"ISSN = @issn, " +
                    $"IssueNumber = @issueNumber " +
                    $"WHERE NotesID = @id";
                db.Query(query, newspaperDto);
            }
        }
    }
}
