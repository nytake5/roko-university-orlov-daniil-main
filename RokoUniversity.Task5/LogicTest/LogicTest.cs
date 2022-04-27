using AutoMapper;
using Library.Dto;
using Library.Entities;
using Library.FakeRepositories;
using Library.IRepositores;
using Library.IServices;
using LibraryServices;
using Microsoft.Extensions.Logging;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Tests.LogicTest
{
    public class Tests
    {
        INotesService notesService;

        [SetUp]
        public void OneTimeSetup()
        {
            ILogger<NotesService> logger = null;
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MappingProfile());
            });
            IMapper mapper = mappingConfig.CreateMapper();
            List<NotesDto> notes = new List<NotesDto>();
            INotesRepository notesRepository = new NotesRepository(notes);
            IBooksRepository booksRepository = new BooksRepository(notes);
            INewspapersRepository newspapersRepository = new NewspapersRepository(notes);
            IPatentsRepository patentsRepository = new PatentsRepository(notes);
            IAuthorsRepository authorsRepository = new AuthorsRepository();
            notesService = new NotesService(logger, mapper, notesRepository, authorsRepository, booksRepository, newspapersRepository, patentsRepository);
        }

        [Test]
        public void RemoveNotesTest()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            var notes = notesService.GetNotes();
            
            Assert.True(notesService.RemoveNotes(1));
        }

        [Test]
        public void FindNotesTest()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            Assert.That(notesService.FindByTitle("Voina i Mir") != null);
        }

        [Test]
        public void SortByDateTest()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            var newspaper = new Newspaper()
            {
                Title = "Pravda",
                PageCount = 100,
                PlaceOfPublication = "Moskva",
                Publisher = "KPPS",
                YearOfPublication = 2020,
                ISSN = null,
                IssueNumber = 5,
                Description = "Mnogo pravdi",
            };
            notesService.InsertNewspaper(newspaper);

            var notes = notesService.SortByDate();

            bool flag = true;
            for (int i = 1; i < notes.Count; i++)
            {
                int year1 = 0;
                int year2 = 0;
                if (notes[i] as Book == null)
                {
                    if (notes[i] as Newspaper == null)
                    {
                        year1 = (notes[i] as Patent).DateOfPublication.Year;
                    }
                    else
                    {
                        year1 = (notes[i] as Newspaper).YearOfPublication;
                    }
                }
                else
                {
                    year1 = (notes[i] as Book).YearOfPublication;
                }
                if (notes[i - 1] as Book == null)
                {
                    if (notes[i - 1] as Newspaper == null)
                    {
                        year2 = (notes[i - 1] as Patent).DateOfPublication.Year;
                    }
                    else
                    {
                        year2 = (notes[i - 1] as Newspaper).YearOfPublication;
                    }
                }
                else
                {
                    year2 = (notes[i - 1] as Book).YearOfPublication;
                }
                if (year1 < year2)
                {
                    flag = false;
                }
            }
            Assert.True(flag);
        }

        [Test]
        public void FindByTitleTest()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            var book1 = new Book()
            {
                Title = "Prestuplenie i nakazanie",
                PageCount = 900,
                PlaceOfPublication = "Praga",
                Publisher = "ChechRe",
                YearOfPublication = 1964,
                ISBN = null,
                Description = "Pro musli strannih lydei, nu i pro tvarei toje",
            };
            book1.Authors = new List<Author>() { new Author() { FirstName = "Fedor", LastName = "Dostoevskii" } };
            notesService.InsertBook(book1);

            var notes = notesService.FindByTitle("Voina i Mir");
            Assert.That(notes.First().Description.Equals(book.Description));
        }

        [Test]
        public void FindByTitleTest2()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            var book1 = new Book()
            {
                Title = "Prestuplenie i nakazanie",
                PageCount = 900,
                PlaceOfPublication = "Praga",
                Publisher = "ChechRe",
                YearOfPublication = 1964,
                ISBN = null,
                Description = "Pro musli strannih lydei, nu i pro tvarei toje",
            };
            book1.Authors = new List<Author>() { new Author() { FirstName = "Fedor", LastName = "Dostoevskii" } };
            notesService.InsertBook(book1);

            var notes = notesService.FindByTitle("Veshalka");
            Assert.That(notes.First().Description.Equals(patent.Description));
        }

        [Test]
        public void FindByTitleTest3()
        {
            var notes = notesService.FindByTitle("Veshalka");
            Assert.That(notes.Count == 0);
        }

        [Test]
        public void GrouppingByYearTest()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var patent = new Patent()
            {
                Title = "Veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };
            notesService.InsertPatent(patent);

            var book1 = new Book()
            {
                Title = "Prestuplenie i nakazanie",
                PageCount = 900,
                PlaceOfPublication = "Praga",
                Publisher = "Teremok",
                YearOfPublication = 1964,
                ISBN = null,
                Description = "Pro musli strannih lydei, nu i pro tvarei toje",
            };
            book1.Authors = new List<Author>() { new Author() { FirstName = "Fedor", LastName = "Dostoevskii" } };
            notesService.InsertBook(book1);

            var notes = notesService.GroupByYearOfPublication();
            Assert.That(notes.First().Key != notes.Last().Key && notes.First().Value.Count == 1);
        }
    }
}