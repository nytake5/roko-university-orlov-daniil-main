using AutoMapper;
using Library.Dto;
using Library.Entities;
using Library.Entities.Exceptions;
using Library.IRepositores;
using Library.IServices;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;

namespace LibraryServices
{
    public class NotesService : INotesService
    {
        private readonly ILogger<NotesService> _logger;
        private readonly INotesRepository _notesRepository;
        private readonly IBooksRepository _booksRepository;
        private readonly INewspapersRepository _newspapersRepository;
        private readonly IPatentsRepository _patentsRepository;
        private readonly IAuthorsRepository _authorRepository;
        private readonly IMapper _mapper;

        public NotesService(ILogger<NotesService> logger, IMapper mapper,
            INotesRepository notesRepository, IAuthorsRepository authorRepository, IBooksRepository booksRepository,
            INewspapersRepository newspapersRepository, IPatentsRepository patentsRepository)
        {
            _logger = logger;
            _notesRepository = notesRepository;
            _authorRepository = authorRepository;
            _mapper = mapper;
            _booksRepository = booksRepository;
            _newspapersRepository = newspapersRepository;
            _patentsRepository = patentsRepository;
        }
        public int InsertNotes(NotesDto notes)
        {
            int id = -1;
            notes.ID = _notesRepository.InsertNotes(notes);
            switch (notes.Type)
            {
                case NotesType.Book:
                    id = _booksRepository.InsertBook((BookDto)notes);
                    break;
                case NotesType.Newspaper:
                    _newspapersRepository.InsertNewspaper((NewspaperDto)notes);
                    break;
                case NotesType.Patent:
                    id = _patentsRepository.InsertPatent((PatentDto)notes);
                    break;
            }
            return id;
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

        public List<Notes> FindBooksAndPatentsByAuthor(Author author)
        {
            var notes = new List<Notes>();
            var authorId = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));

            var booksDto = _booksRepository.FindBooksByAuthor(authorId);
            var books = GetAuthorsForBooks(booksDto);

            var patentsDto = _patentsRepository.FindPatentsByInnovator(authorId);
            var patents = GetAuthorsForPatents(patentsDto);

            notes.AddRange(books);
            notes.AddRange(patents);

            return notes;
        }

        public List<Book> FindBooksByAuthor(Author author)
        {
            var authorId = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
            var booksDto = _booksRepository.FindBooksByAuthor(authorId);
            return GetAuthorsForBooks(booksDto);
        }

        public List<Notes> FindByTitle(string title)
        {
            var notes = new List<Notes>();

            var books = GetAuthorsForBooks(_booksRepository.FindBookByTitle(title));

            var newspapers = _mapper.Map<List<Newspaper>>(_newspapersRepository.FindNewspaperByTitle(title));

            var patents = GetAuthorsForPatents(_patentsRepository.FindPatentByTitle(title));

            notes.AddRange(books);
            notes.AddRange(newspapers);
            notes.AddRange(patents);

            return notes;
        }

        public List<Notes> FindByTitleSkipTake(string title, int recSkip, int pageSize) {
            var notesDto = _notesRepository.FindByTitleSkipTake(title, recSkip, pageSize);
            var notes = new List<Notes>();
            foreach (var notedto in notesDto)
            {
                switch (notedto.Type)
                {
                    case NotesType.Book:
                        var book = GetAuthorsForBooks(new List<BookDto>() { (BookDto)notedto }).First();
                        notes.Add(book);
                        break;
                    case NotesType.Newspaper:
                        var newspaper = _mapper.Map<Newspaper>((NewspaperDto)notedto);
                        notes.Add(newspaper);
                        break;
                    case NotesType.Patent:
                        var patent = GetAuthorsForPatents(new List<PatentDto>() { (PatentDto)notedto }).First();
                        notes.Add(patent);
                        break;
                }
            }
            return notes;
        }


        public List<Patent> FindPatentsByInnovator(Author author)
        {
            var authorId = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
            var patentsDto = _patentsRepository.FindPatentsByInnovator(authorId);
            return GetAuthorsForPatents(patentsDto);
        }

        public List<Notes> GetNotes()
        {
            var notesDto = _notesRepository.GetNotes();
            var notes = new List<Notes>();
            foreach (var notedto in notesDto)
            {
                switch (notedto.Type)
                {
                    case NotesType.Book:
                        var book = GetAuthorsForBooks(new List<BookDto>() { (BookDto)notedto }).First();
                        notes.Add(book);
                        break;
                    case NotesType.Newspaper:
                        var newspaper = _mapper.Map<Newspaper>((NewspaperDto)notedto);
                        notes.Add(newspaper);
                        break;
                    case NotesType.Patent:
                        var patent = GetAuthorsForPatents(new List<PatentDto>() { (PatentDto)notedto }).First();
                        notes.Add(patent);
                        break;
                }
            }
            return notes;
        }

        public List<Notes> GetNotesSkipTake(int recSkip, int pageSize)
        {
            var notesDto = _notesRepository.GetNotesSkipTake(recSkip, pageSize);
            var notes = new List<Notes>();
            foreach (var notedto in notesDto)
            {
                switch (notedto.Type)
                {
                    case NotesType.Book:
                        var book = GetAuthorsForBooks(new List<BookDto>() { (BookDto)notedto }).First();
                        notes.Add(book);
                        break;
                    case NotesType.Newspaper:
                        var newspaper = _mapper.Map<Newspaper>((NewspaperDto)notedto);
                        notes.Add(newspaper);
                        break;
                    case NotesType.Patent:
                        var patent = GetAuthorsForPatents(new List<PatentDto>() { (PatentDto)notedto }).First();
                        notes.Add(patent);
                        break;
                }
            }
            return notes;
        }

        public int Count()
        {
            return _notesRepository.GetNotesCount();
        }

        private List<Book> GetAuthorsForBooks(List<BookDto> booksdto)
        {
            var booksIDs = booksdto.Select(p => p.BookID).ToList();
            var books = new List<Book>();
            var authors = _authorRepository.GetAuthorsByBooksIds(booksIDs);
            foreach (var bookdto in booksdto)
            {
                var book = _mapper.Map<Book>(bookdto);
                book.Authors = _mapper.Map<List<Author>>(authors.Where(b => b.ID == bookdto.BookID));
                books.Add(book);
            }
            return books;
        }
        private List<Patent> GetAuthorsForPatents(List<PatentDto> patentsdto)
        {
            var patentsIDs = patentsdto.Select(p => p.PatentID).ToList();
            var patents = new List<Patent>();
            var innovators = _authorRepository.GetAuthorsByPatentIds(patentsIDs);
            foreach (var patentdto in patentsdto)
            {
                var patent = _mapper.Map<Patent>(patentdto);
                patent.Authors = _mapper.Map<List<Author>>(innovators.Where(b => b.ID == patentdto.PatentID));
                patents.Add(patent);
            }
            return patents;
        }

        public Dictionary<string, List<Book>> OutputByPublisher(string pubBegins)
        {
            var resDc = new Dictionary<string, List<Book>>();
            var tempDc = _booksRepository.OutputByPublisher(pubBegins);
            foreach (var group in tempDc)
            {
                var books = GetAuthorsForBooks(group.Value);
                resDc.Add(group.Key, books);
            }
            return resDc;
        }

        public Dictionary<int, List<Notes>> GroupByYearOfPublication()
        {

            var tempList = _notesRepository.GroupByYearOfPublication();
            var resDc = new Dictionary<int, List<Notes>>();
            foreach (var group in tempList.GroupBy(x => x.YearOfPublication))
            {
                var list = new List<Notes>();
                foreach (var note in group)
                {
                    if (note as BookDto != null)
                    {
                        var temp = note as BookDto;
                        var book = GetAuthorsForBooks(new List<BookDto> { temp }).First();
                        list.Add(book);
                    }
                    else if (note as NewspaperDto != null)
                    {
                        var newspaper = note as NewspaperDto;
                        list.Add(_mapper.Map<Newspaper>(newspaper));
                    }
                    else if (note as PatentDto != null)
                    {
                        var temp = note as PatentDto;
                        var patent = GetAuthorsForPatents(new List<PatentDto> { temp }).First();
                        list.Add(patent);
                    }
                }
                resDc.Add(group.Key, list);
            }
            return resDc;
        }

        public void InsertBook(Book book)
        {
            if (!CheckUniqueBook(book.Title, book.YearOfPublication, _mapper.Map<List<AuthorDto>>(book.Authors), book.ISBN))
            {
                throw new UniquenessException("This book already exists!");
            }
            var bookDto = _mapper.Map<BookDto>(book);
            int bookID = InsertNotes(bookDto);
            List<int> authorsID = new List<int>();
            foreach (var author in book.Authors)
            {
                int id = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
                if (id == -1)
                {
                    id = _authorRepository.InsertAuthor(_mapper.Map<AuthorDto>(author));
                }
                authorsID.Add(id);
            }
            _authorRepository.InsertBookToAuthor(bookID, authorsID);
        }

        public void InsertPatent(Patent patent)
        {
            if (!CheckUniquePatent(patent.Number, patent.PlaceOfPublication))
            {
                throw new UniquenessException("This patent already exists!");
            }
            var patentDto = _mapper.Map<PatentDto>(patent);
            int patentID = InsertNotes(patentDto);
            List<int> authorsID = new List<int>();
            foreach (var author in patent.Authors)
            {
                int id = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
                if (id == -1)
                {
                    id = _authorRepository.InsertAuthor(_mapper.Map<AuthorDto>(author));
                }
                authorsID.Add(id);
            }
            _authorRepository.InsertPatentToAuthor(patentID, authorsID);
        }

        public void InsertNewspaper(Newspaper newspaper)
        {
            if (!CheckUniqueNewspaper(newspaper.Title, newspaper.Publisher, newspaper.YearOfPublication, newspaper.ISSN))
            {
                throw new UniquenessException("This newspaper already exists!");
            }
            var newspaperDto = _mapper.Map<NewspaperDto>(newspaper);
            InsertNotes(newspaperDto);
        }

        public bool RemoveNotes(int notesID)
        {
            return _notesRepository.RemoveNotes(notesID);
        }

        public List<Notes> SortByDate(bool descending = false)
        {
            var notes = new List<Notes>();
            var notesDto = _notesRepository.SortByDate(descending);
            foreach (var notedto in notesDto)
            {
                switch (notedto.Type)
                {
                    case NotesType.Book:
                        var book = GetAuthorsForBooks(new List<BookDto>() { (BookDto)notedto }).First();
                        notes.Add(book);
                        break;
                    case NotesType.Newspaper:
                        var newspaper = _mapper.Map<Newspaper>((NewspaperDto)notedto);
                        notes.Add(newspaper);
                        break;
                    case NotesType.Patent:
                        var patent = GetAuthorsForPatents(new List<PatentDto>() { (PatentDto)notedto }).First();
                        notes.Add(patent);
                        break;
                }
            }
            return notes;
        }


        private bool CheckUniqueBook(string title, int yearOfPublication, List<AuthorDto> authors, string? ISBN)
        {
            if (ISBN != null)
            {
                return _booksRepository.CheckUniqueISBN(ISBN);
            }
            else
            {
                var result = _booksRepository.CheckUniqueBook(title, yearOfPublication, authors);
                return result.Count == 0 ? true : _authorRepository.CheckUniqueAuthors(authors, result, true);
            }
        }

        private bool CheckUniqueNewspaper(string title, string publisher, int yearOfPublication, string? ISSN)
        {
            if (ISSN != null)
            {
                return _newspapersRepository.CheckUniqueISSN(ISSN);
            }
            else
            {
                var result = _newspapersRepository.CheckUniqueNewspaper(title, publisher, yearOfPublication);
                return result.Count == 0;
            }
        }

        private bool CheckUniquePatent(int number, string country)
        {
            var result = _patentsRepository.CheckUniquePatent(number, country);
            return result.Count == 0;
        }

        public Notes GetNote(int id)
        {
            var note = _notesRepository.GetNote(id);
            switch (note.Type)
            {
                case NotesType.Book:
                    var book = GetAuthorsForBooks(new List<BookDto> { (note as BookDto) }).First();
                    return book;
                case NotesType.Newspaper:
                    return _mapper.Map<Newspaper>(note as NewspaperDto);
                case NotesType.Patent:
                    var patent = GetAuthorsForPatents(new List<PatentDto> { note as PatentDto }).First();
                    return patent;
            }
            return null;
        }

        public List<Newspaper> FindNewspaperByTitleAndPublisher(string title, string publisher)
        {
            return _mapper.Map<List<Newspaper>>(_newspapersRepository.GetNewspaperByTitleAndPublisher(title, publisher));
        }

        public List<Edition> GetNewpapersExistingEditions()
        {
            return _newspapersRepository.GetExistingEditions();
        }

        public void UpdateNote(Notes note)
        {
            switch (note.GetNoteType())
            {
                case NotesType.Book:
                    UpdateBook(note); 
                    break;
                case NotesType.Newspaper:
                    UpdateNewspaper(note);
                    break;
                case NotesType.Patent:
                    UpdatePatent(note); 
                    break;
            }
        }

        private void UpdatePatent(Notes note)
        {
            var patent = note as Patent;
            if (!CheckUniquePatent(patent.Number, patent.PlaceOfPublication))
            {
                throw new UniquenessException("This patent already exists!");
            }
            _patentsRepository.UpdatePatent(_mapper.Map<PatentDto>(patent));
            _notesRepository.UpdateNote(_mapper.Map<PatentDto>(patent));
            UpdateAuthorForPatent(patent);
        }

        private void UpdateNewspaper(Notes note)
        {
            var newspaper = note as Newspaper;
            if (!CheckUniqueNewspaper(newspaper.Title, newspaper.Publisher, newspaper.YearOfPublication, newspaper.ISSN))
            {
                throw new UniquenessException("This newspaper already exists!");
            }
            _newspapersRepository.UpdateNewspaper(_mapper.Map<NewspaperDto>(newspaper));
            _notesRepository.UpdateNote(_mapper.Map<NewspaperDto>(newspaper));
        }

        private void UpdateBook(Notes note)
        {
            var book = note as Book;
            if (!CheckUniqueBook(book.Title, book.YearOfPublication, _mapper.Map<List<AuthorDto>>(book.Authors), book.ISBN))
            {
                throw new UniquenessException("This book already exists!");
            }
            _booksRepository.UpdateBook(_mapper.Map<BookDto>(book));
            _notesRepository.UpdateNote(_mapper.Map<BookDto>(book));
            UpdateAuthorForBook(book);
        }

        private void UpdateAuthorForBook(Book newBook)
        {
            var note = _notesRepository.GetNote(newBook.ID);
            var oldBook = GetAuthorsForBooks(new List<BookDto> { (note as BookDto) }).First();
            oldBook.ID = (note as BookDto).BookID;
            var intersect = oldBook.Authors.Intersect(newBook.Authors);
            if (intersect.Count() == oldBook.Authors.Count)
            {
                return;
            }
            RemoveOldRelationship(newBook, oldBook);

            InsertNewRelationship(newBook, oldBook);
        }


        private void InsertNewRelationship(Book newBook, Book oldBook)
        {
            List<int> authorsID = new List<int>();
            foreach (var author in newBook.Authors.Except(oldBook.Authors))
            {
                int id = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
                if (id == -1)
                {
                    id = _authorRepository.InsertAuthor(_mapper.Map<AuthorDto>(author));
                }
                authorsID.Add(id);
            }
            _authorRepository.InsertBookToAuthor(oldBook.ID, authorsID);
        }

        private void RemoveOldRelationship(Book newBook, Book oldBook)
        {
            List<int> deletedAuthorId = new List<int>();
            foreach (var author in oldBook.Authors)
            {
                if (!newBook.Authors.Contains(author))
                {
                    deletedAuthorId.Add(author.AuthorId);
                }
            }
            _authorRepository.RemoveRelationshipBook(oldBook.ID, deletedAuthorId);
        }
        private void UpdateAuthorForPatent(Patent newPatent)
        {
            var note = _notesRepository.GetNote(newPatent.ID);
            var oldPatent = GetAuthorsForPatents(new List<PatentDto> { (note as PatentDto) }).First();
            oldPatent.ID = (note as PatentDto).PatentID;
            var intersect = oldPatent.Authors.Intersect(newPatent.Authors);
            if (intersect.Count() == oldPatent.Authors.Count)
            {
                return;
            }
            RemoveOldRelationship(newPatent, oldPatent);

            InsertNewRelationship(newPatent, oldPatent);
        }

        private void InsertNewRelationship(Patent newPatent, Patent oldPatent)
        {
            List<int> authorsID = new List<int>();
            foreach (var author in newPatent.Authors.Except(oldPatent.Authors))
            {
                int id = _authorRepository.FindAuthorByName(_mapper.Map<AuthorDto>(author));
                if (id == -1)
                {
                    id = _authorRepository.InsertAuthor(_mapper.Map<AuthorDto>(author));
                }
                authorsID.Add(id);
            }
            _authorRepository.InsertPatentToAuthor(oldPatent.ID, authorsID);
        }

        private void RemoveOldRelationship(Patent newPatent, Patent oldPatent)
        {
            List<int> deletedAuthorId = new List<int>();
            foreach (var author in oldPatent.Authors)
            {
                if (!newPatent.Authors.Contains(author))
                {
                    deletedAuthorId.Add(author.AuthorId);
                }
            }
            _authorRepository.RemoveRelationshipPatent(oldPatent.ID, deletedAuthorId);
        }
    }
}
