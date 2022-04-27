using Library.Entities;
using Library.Entities.Exceptions;
using Library.IServices;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Library.UI.ConsoleUI
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private readonly IAuthorsService _authorService;
        private readonly INotesService _notesService;
        public Worker(ILogger<Worker> logger, IAuthorsService authorService, INotesService notesService)
        {
            _logger = logger;
            _authorService = authorService;
            _notesService = notesService;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            Console.WriteLine("Welcome to the library!");
            Console.WriteLine($"If you want to {Environment.NewLine}" +
                $"View all the catalog notes - 1 {Environment.NewLine}" +
                $"Add an note to catalog - 2{Environment.NewLine}" +
                $"Remove an note from catalog - 3{Environment.NewLine}" +
                $"Find note by title - 4{Environment.NewLine}" +
                $"Sort notes by year of release - 5{Environment.NewLine}" +
                $"Find all books of some author - 6{Environment.NewLine}" +
                $"Find all patents of some author - 7{Environment.NewLine}" +
                $"Find all books and patent of some author - 8{Environment.NewLine}" +
                $"View all the publisher's books - 9{Environment.NewLine}" +
                $"Group note for year - 10{Environment.NewLine}" +
                $"Exit - 0");
            while (true)
            {
                string line = Console.ReadLine();
                int k;
                while (!int.TryParse(line, out k))
                {
                    Console.WriteLine("Please, choose a move");
                    line = Console.ReadLine();
                }
                switch (k)
                {
                    case 1:
                        ViewAll();
                        break;
                    case 2:
                        AddNote();
                        break;
                    case 3:
                        RemoveNote();
                        break;
                    case 4:
                        FindByTitle();
                        break;
                    case 5:
                        SortByYear();
                        break;
                    case 6:
                        FindAllBooksByAuthor();
                        break;
                    case 7:
                        FindAllPatentsByAuthor();
                        break;
                    case 8:
                        FindAllBooksAndPatentsByAuthor();
                        break;
                    case 9:
                        ViewAllByPublisher();
                        break;
                    case 10:
                        GroupForYear();
                        break;
                    case 0:
                        return Task.CompletedTask;
                    default:
                        Console.WriteLine("Please try again");
                        break;
                }
            }
        }

        private void ViewAll()
        {
            var notes = _notesService.GetNotes();
            foreach (var note in notes)
            {
                Console.WriteLine(note.ToString());
            }
        }

        private void AddNote()
        {
            Console.WriteLine("Please, write that you want to add book - 1, newspaper - 2, patent - 3");
            int k = int.Parse(Console.ReadLine());
            switch (k)
            {
                case 1:
                    TryInsertBook();
                    break;
                case 2:
                    TryInsertNewspaper();
                    break;
                case 3:
                    TryInsertPatent();
                    break;
                default:
                    Console.WriteLine("Please try again");
                    break;  
            }
            
        }

        private void TryInsertPatent()
        {
            try
            {
                _notesService.InsertPatent(AddPatent());
            }
            catch (ArgumentException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
            catch (UniquenessException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
        }

        private void TryInsertNewspaper()
        {
            try
            {
                _notesService.InsertNewspaper(AddNewspaper());
            }
            catch (ArgumentException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
            catch (UniquenessException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
        }

        private void TryInsertBook()
        {
            try
            {
                _notesService.InsertBook(AddBook());
            }
            catch (ArgumentException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
            catch (UniquenessException ex)
            {
                _logger.LogError("LogError {0}", ex, ex.Message);
                Console.WriteLine("Try again!");
            }
        }

        private Book AddBook()
        {
            var book = new Book();
            int k;

            Console.WriteLine("Enter a title");
            book.Title = Console.ReadLine();

            Console.WriteLine("Enter a page count");
            book.PageCount = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Enter a publisher");
            book.Publisher = Console.ReadLine();

            Console.WriteLine("Enter a place of publication");
            book.PlaceOfPublication = Console.ReadLine();

            Console.WriteLine("Enter a year of publication");
            book.YearOfPublication = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Do you want to enter isbn? Yes - 1");
            if (Console.ReadLine() == "1")
            {
                Console.WriteLine("Enter a ISBN");
                book.ISBN = Console.ReadLine();
            }

            Console.WriteLine("Enter a description");
            book.Description = Console.ReadLine();

            Console.WriteLine("Enter a author/s");
            book.Authors = AddAuthors();

            return book;
        }
        private Newspaper AddNewspaper()
        {
            var newspaper = new Newspaper();
            int k;

            Console.WriteLine("Enter a title");
            newspaper.Title = Console.ReadLine();

            Console.WriteLine("Enter a page count");
            newspaper.PageCount = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Enter a publisher");
            newspaper.Publisher = Console.ReadLine();

            Console.WriteLine("Enter a place of publication");
            newspaper.PlaceOfPublication = Console.ReadLine();

            Console.WriteLine("Enter a year of publication");
            newspaper.YearOfPublication = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Do you want to enter issn? Yes - 1");
            if (Console.ReadLine() == "1")
            {
                Console.WriteLine("Enter a ISBN");
                newspaper.ISSN = Console.ReadLine();
            }

            Console.WriteLine("Enter a number");
            newspaper.IssueNumber = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Enter a description");
            newspaper.Description = Console.ReadLine();

            return newspaper;
        }

        private static int ValidationInt(string line, out int k)
        {
            while (!int.TryParse(line, out k))
            {
                Console.WriteLine("Please, choose a move");
                line = Console.ReadLine();
            }
            return k;
        }
        private static DateTime ValidationDateTime(string line, out DateTime d)
        {
            while (!DateTime.TryParse(line, out d))
            {
                Console.WriteLine("Please, choose a move");
                line = Console.ReadLine();
            }
            return d;
        }

        private Patent AddPatent()
        {
            var patent = new Patent();
            int k;
            DateTime d;

            Console.WriteLine("Enter a title");
            patent.Title = Console.ReadLine();

            Console.WriteLine("Enter a page count");
            patent.PageCount = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Enter a date of publication in format 'yyyy/mm/dd'");
            patent.DateOfPublication = ValidationDateTime(Console.ReadLine(), out d);

            Console.WriteLine("Enter a place of publication");
            patent.PlaceOfPublication = Console.ReadLine();

            Console.WriteLine("Enter a number");
            patent.Number = ValidationInt(Console.ReadLine(), out k);

            Console.WriteLine("Enter a date of application submission in format 'yyyy/mm/dd'");
            patent.DateOfApplicationSubmission = ValidationDateTime(Console.ReadLine(), out d);

            Console.WriteLine("Enter a description");
            patent.Description = Console.ReadLine();

            Console.WriteLine("Enter a author/s");
            patent.Authors = AddAuthors();

            return patent;
        }

        private List<Author> AddAuthors()
        {
            var resList = new List<Author>();
            int k = 1;
            while (k != 0)
            {
                switch (k)
                {
                    case 1:
                        Author author = new Author();
                        Console.WriteLine("Enter author firstname");
                        author.FirstName = Console.ReadLine();
                        Console.WriteLine("Enter author lastname");
                        author.LastName = Console.ReadLine();
                        resList.Add(author);
                        break;
                    default:
                        break;
                }
                Console.WriteLine("If you want to continue adding authors, press 1" +
                    "Else - 0");
                k = int.Parse(Console.ReadLine());
            }
            return resList;
        }

        private void RemoveNote()
        {
            Console.WriteLine("Enter a notes id");
            int id;
            if (!int.TryParse(Console.ReadLine(), out id))
            {
                Console.WriteLine("Please try again");
                return;
            }
            if (_notesService.RemoveNotes(id))
            {
                Console.WriteLine("You remove one notes");
            }
            else
            {
                Console.WriteLine("Remove did not occur");
            }
        }

        private void FindByTitle()
        {
            Console.WriteLine("Enter a title of note");
            string title = Console.ReadLine();
            if (title.Length > 300)
            {
                _logger.LogError("LogError {0}", new ArgumentException("Your title it's too long!"));
                Console.WriteLine("Try again!");
            }
            var listNotes = _notesService.FindByTitle(title);
            if (listNotes.Count == 0)
            {
                Console.WriteLine("Alas, there are no such records");
            }
            else
            {
                foreach (var note in listNotes)
                {
                    Console.WriteLine(note.ToString());
                }
            }
        }

        private void SortByYear()
        {
            var listNotes = _notesService.SortByDate();
            foreach (var note in listNotes)
            {
                Console.WriteLine(note.ToString());
            }
        }

        private void FindAllBooksByAuthor()
        {
            Author author = new Author();
            Console.WriteLine("Enter author firstname");
            author.FirstName = Console.ReadLine();
            Console.WriteLine("Enter author lastname");
            author.LastName = Console.ReadLine();
            var listBook = _notesService.FindBooksByAuthor(author);
            if (listBook.Count == 0)
            {
                Console.WriteLine("Alas, there are no such records");
            }
            else
            {
                foreach (var note in listBook)
                {
                    Console.WriteLine(note.ToString());
                }
            }
        }

        private void FindAllPatentsByAuthor()
        {
            Author author = new Author();
            Console.WriteLine("Enter author firstname");
            author.FirstName = Console.ReadLine();
            Console.WriteLine("Enter author lastname");
            author.LastName = Console.ReadLine();
            var listPatents = _notesService.FindPatentsByInnovator(author);
            if (listPatents.Count == 0)
            {
                Console.WriteLine("Alas, there are no such records");
            }
            else
            {
                foreach (var note in listPatents)
                {
                    Console.WriteLine(note.ToString());
                }
            }
        }

        private void FindAllBooksAndPatentsByAuthor()
        {
            Author author = new Author();
            Console.WriteLine("Enter author firstname");
            author.FirstName = Console.ReadLine();
            Console.WriteLine("Enter author lastname");
            author.LastName = Console.ReadLine();
            var listNotes = _notesService.FindBooksAndPatentsByAuthor(author);
            if (listNotes.Count == 0)
            {
                Console.WriteLine("Alas, there are no such records");
            }
            else
            {
                foreach (var note in listNotes)
                {
                    Console.WriteLine(note.ToString());
                }
            }
        }

        private void ViewAllByPublisher()
        {
            Console.WriteLine("Enter a publisher");
            string publisher = Console.ReadLine();
            if (publisher.Length > 300)
            {
                _logger.LogError("LogError {0}", new ArgumentException("You have entered a Publisher that is too long!"));
                Console.WriteLine("Try again!");
            }
            var dcNote = _notesService.OutputByPublisher(publisher);
            if (dcNote.Count == 0)
            {
                Console.WriteLine("Alas, there are no such records");
            }
            else
            { 
                foreach (var note in dcNote)
                {
                    Console.WriteLine(note.Key);
                    foreach (var item in note.Value)
                    {
                        Console.WriteLine(item.ToString());
                    }
                }
            }
        }

        private void GroupForYear()
        {
            var dcNote = _notesService.GroupByYearOfPublication();
            foreach (var group in dcNote)
            {
                Console.WriteLine("\t" + group.Key);
                foreach (var item in group.Value)
                {
                    Console.WriteLine(item.ToString());
                }
            }
        }
    }
}
