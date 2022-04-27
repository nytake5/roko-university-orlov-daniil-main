using AutoMapper;
using Library.Dto;
using Library.Entities;
using Library.Entities.Exceptions;
using Library.FakeRepositories;
using Library.IRepositores;
using Library.IServices;
using LibraryServices;
using Microsoft.Extensions.Logging;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using Tests.LogicTest;

namespace LogicTest
{
    class BookTest
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
        [TestCase("Voina i Mir", 2000, "Moskva", "Teremok", "1911", "0-545-01022-5", "Horoshay kniga")]
        [TestCase("Prestuplenie i nakazanie", 900, "Praga", "ChechRe", "1964", null, "Pro musli strannih lydei, nu i pro tvarei toje")]
        [TestCase("Tihii Don", 900, "Saint-Peterburg", "Melnica", 1912, null, "Kazaki molodcii")]
        public void CreateBookTestTrue(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? isbn, string desc)
        {
            Assert.DoesNotThrow(() => MethodThatDoesntThrows());

            void MethodThatDoesntThrows()
            {
                var book = new Book()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    Publisher = publisher,
                    YearOfPublication = yearOfpublication,
                    ISBN = isbn,
                    Description = desc,
                };
            }
        }

        [Test]
        [TestCase("Voina i Mir", 2000, "Moskva", "Teremok", "-1", "", "Horoshay kniga")]
        [TestCase("Mir i Voina", 2100, "Moskva", "Teremok", "1911", "0--5", "Horoshay kniga")]
        [TestCase("Mir i Voina", 2100, "MoskvaМосква", "Teremok", "1911", "0--5", "Horoshay kniga")]
        [TestCase("Tihii Don", 900, "Saint-Peterburg", "Melnica", 1912, "null", "Kazaki molodcii")]
        public void CreateBookTestFalse(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? isbn, string desc)
        {
            Assert.Throws<ArgumentException>(() => MethodThatThrows());

            void MethodThatThrows()
            {
                new Book()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    Publisher = publisher,
                    YearOfPublication = yearOfpublication,
                    ISBN = isbn,
                    Description = desc,
                };
            };
        }

        [Test]
        [TestCase("Voina i Mir", 2000, "Moskva", "Teremok", "1911", "0-545-01022-5", "Horoshay kniga", "Lev", "Tolstoi")]
        [TestCase("Prestuplenie i nakazanie", 900, "Praga", "ChechRe", "1964", null, "Pro musli strannih lydei, nu i pro tvarei toje", "Fedor", "Dostoevskii")]
        public void InsertBookTest(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? isbn, string desc, string firstname, string lasname)
        {
            var book = new Book()
            {
                Title = title,
                PageCount = pageCount,
                PlaceOfPublication = placeOfPublication,
                Publisher = publisher,
                YearOfPublication = yearOfpublication,
                ISBN = isbn,
                Description = desc,
            };
            book.Authors = new List<Author>() { new Author() { FirstName = firstname, LastName = lasname } };

            Assert.DoesNotThrow(() => notesService.InsertBook(book));
        }

        [Test]
        public void InsertBookTestUnique()
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

            var book1 = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Samara",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = "0-545-01022-5",
                Description = "Kopia horoshoy knigi",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };

            Assert.Throws<UniquenessException>(() => notesService.InsertBook(book1));
        }

        [Test]
        public void InsertBookTestUnique2()
        {
            var book = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Moskva",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = null,
                Description = "Horoshay kniga",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };
            notesService.InsertBook(book);

            var book1 = new Book()
            {
                Title = "Voina i Mir",
                PageCount = 2000,
                PlaceOfPublication = "Samara",
                Publisher = "Teremok",
                YearOfPublication = 1911,
                ISBN = null,
                Description = "Kopia horoshoy knigi",
            };
            book.Authors = new List<Author>() { new Author() { FirstName = "Lev", LastName = "Tolstoi" } };

            Assert.Throws<UniquenessException>(() => notesService.InsertBook(book1));
        }



        [Test]
        public void GruppingByPublisherTest()
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

            var notes = notesService.OutputByPublisher("Tere");
            Assert.That(notes.Count == 1);
        }

        [Test]
        public void GruppingByPublisherTest2()
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
            var notes = notesService.OutputByPublisher("GFR");
            Assert.That(notes.Count == 0);
        }
    }
}
