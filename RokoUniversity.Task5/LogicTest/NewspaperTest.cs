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
    class NewspaperTest
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
        [TestCase("Pravda", 100, "Moskva", "KPPS", 2020, "0654-3245", 5, "Mnogo pravdi")]
        [TestCase("Ne Pravda", 150, "Moskva", "Umoristi", 2021, "0324-3245", 1, "Mnogo pravdi")]
        [TestCase("Vogue-Russia", 100, "Moskva", "Vogue", 2022, "7777-5768", 1, "Modnii jurnal")]
        public void CreateNewspaperTestTrue(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? issn, int number, string desc)
        {
            Assert.DoesNotThrow(() => MethodThatDoesntThrows());

            void MethodThatDoesntThrows()
            {
                var newspaper = new Newspaper()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    Publisher = publisher,
                    YearOfPublication = yearOfpublication,
                    ISSN = issn,
                    IssueNumber = number,
                    Description = desc,
                };
            }
        }

        [Test]
        [TestCase("Ne pravdа", -100, "Moskva", "KPPS", 2020, null, 5, "Mnogo pravdi")]
        [TestCase("Pravda", 100, "", "KPPS", 2020, null, 5, "Mnogo pravdi")]
        [TestCase("Vogue-Russia", 100, "Moskva", "Vogue", 2022, "777-568", 1, "Modnii jurnal")]
        public void CreateNewspaperTestFalse(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? issn, int number, string desc)
        {
            Assert.Throws<ArgumentException>(() => MethodThatThrows());

            void MethodThatThrows()
            {
                new Newspaper()
                {
                    Title = title,
                    PageCount = pageCount,
                    PlaceOfPublication = placeOfPublication,
                    Publisher = publisher,
                    YearOfPublication = yearOfpublication,
                    ISSN = issn,
                    IssueNumber = number,
                    Description = desc,
                };
            };
        }

        [Test]
        [TestCase("Pravda", 100, "Moskva", "KPPS", 2020, "0654-3245", 5, "Mnogo pravdi")]
        [TestCase("Ne Pravda", 150, "Moskva", "Umoristi", 2021, "0324-3245", 1, "Mnogo pravdi")]
        public void InsertNewspaperTest(string title, int pageCount, string placeOfPublication, string publisher, int yearOfpublication, string? issn, int number, string desc)
        {
            var newspaper = new Newspaper()
            {
                Title = title,
                PageCount = pageCount,
                PlaceOfPublication = placeOfPublication,
                Publisher = publisher,
                YearOfPublication = yearOfpublication,
                ISSN = issn,
                IssueNumber = number,
                Description = desc,
            };
            Assert.DoesNotThrow(() => notesService.InsertNewspaper(newspaper));
        }

        [Test]
        public void InsertNewspaperTestUnique()
        {
            var newspaper = new Newspaper()
            {
                Title = "Pravda",
                PageCount = 100,
                PlaceOfPublication = "Moskva",
                Publisher = "KPPS",
                YearOfPublication = 2020,
                ISSN = "0654-3245",
                IssueNumber = 5,
                Description = "Mnogo pravdi",
            };
            notesService.InsertNewspaper(newspaper);

            var newspaper1 = new Newspaper()
            {
                Title = "Pravda-da",
                PageCount = 100,
                PlaceOfPublication = "Moskva",
                Publisher = "KPPSS",
                YearOfPublication = 2020,
                ISSN = "0654-3245",
                IssueNumber = 5,
                Description = "Mnogo pravdi",
            };
            Assert.Throws<UniquenessException>(() => notesService.InsertNewspaper(newspaper1));
        }

        [Test]
        public void InsertNewspaperTestUnique2()
        {
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

            var newspaper1 = new Newspaper()
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
            Assert.Throws<UniquenessException>(() => notesService.InsertNewspaper(newspaper1));
        }
    }
}
