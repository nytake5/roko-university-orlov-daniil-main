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
    class PatentTest
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
        [TestCase("Veshalka", 3, "Paris", @"2001/01/01", @"2005 / 02 / 09", 1, "Horoshay shtuka")]
        [TestCase("Mashina", 2, "Germany", @"1912/03/10", @"1912/03/01", 2, "Vrode prigodilas'")]
        public void CreatePatentTestTrue(string title, int pageCount, string placeOfPublication, string dateOfPublication, string DAS, int number, string desc)
        {
            Assert.DoesNotThrow(() => MethodThatDoesntThrows());

            void MethodThatDoesntThrows()
            {
                var patent = new Patent()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    DateOfPublication = DateTime.Parse(dateOfPublication),
                    DateOfApplicationSubmission = DateTime.Parse(DAS),
                    Number = number,
                    Description = desc,
                };
            }
        }

        [Test]
        [TestCase("Veshalka", -1, "Paris", @"2001/01/01", @"2005 / 02 / 09", 1, "Horoshay shtuka")]
        public void CreatePatentTestFalse(string title, int pageCount, string placeOfPublication, DateTime dateOfPublication, DateTime DAS, int number, string desc)
        {

            Assert.Throws<ArgumentException>(() => MethodThatThrows());

            void MethodThatThrows()
            {
                new Patent()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    DateOfPublication = dateOfPublication,
                    DateOfApplicationSubmission = DAS,
                    Number = number,
                    Description = desc,
                };
            }
        }

        [Test]
        [TestCase("Veshalka", 3, "Paris", @"2001/01/01", @"2005 / 02 / 09", 1, "Horoshay shtuka", "Petr", "Petrov")]
        [TestCase("Mashina", 2, "Germany", @"1912/03/10", @"1912/03/01", 2, "Vrode prigodilas'", "Fedor", "Fedorov")]
        public void InsertPatentTest(string title, int pageCount, string placeOfPublication, string dateOfPublication, string DAS, int number, string desc, string firstname, string lasname)
        {
            var patent = new Patent()
            {
                Title = title,
                PageCount = pageCount,
                PlaceOfPublication = placeOfPublication,
                DateOfPublication = DateTime.Parse(dateOfPublication),
                DateOfApplicationSubmission = DateTime.Parse(DAS),
                Number = number,
                Description = desc,
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = firstname, LastName = lasname } };
            Assert.DoesNotThrow(() => notesService.InsertPatent(patent));
        }

        [Test]
        public void InsertPatentTestUnique()
        {
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

            var patent1 = new Patent()
            {
                Title = "Ne veshalka",
                PageCount = 3,
                PlaceOfPublication = "Paris",
                DateOfPublication = DateTime.Parse(@"2001/01/01"),
                DateOfApplicationSubmission = DateTime.Parse(@"2005 / 02 / 09"),
                Number = 1,
                Description = "Horoshay shtuka",
            };
            patent.Authors = new List<Author>() { new Author() { FirstName = "Petr", LastName = "Petrov" } };

            Assert.Throws<UniquenessException>(() => notesService.InsertPatent(patent));
        }
    }
}
