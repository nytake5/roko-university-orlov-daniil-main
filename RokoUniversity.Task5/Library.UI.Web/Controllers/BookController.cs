using AutoMapper;
using Library.Entities;
using Library.Entities.Exceptions;
using Library.IServices;
using Library.UI.Web.Infrastructure;
using Library.UI.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Library.UI.Web.Controllers
{
    public class BookController : Controller
    {
        private readonly ILogger<NotesController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        private readonly IAuthorsService _authorService;
        public BookController(ILogger<NotesController> logger, INotesService notesService, IMapper mapper, IAuthorsService authorService)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
            _authorService = authorService;
        }
        // GET: BookController
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        // GET: BookController/Details/5
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Details(int id)
        {
            try
            {
                var book = _notesService.GetNote(id) as Book;
                var bookView = _mapper.Map<BookView>(book);
                bookView.Authors = _mapper.Map<List<AuthorView>>(book.Authors);
                return View(bookView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }

        // GET: BookController/Create
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.Authors = _mapper.Map<List<AuthorView>>(_authorService.GetAuthors());
            return View();
        }

        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult AddNewAuthor(IFormCollection formCollection)
        {
            try
            {
                var author = new Author() { FirstName = formCollection["firstname"], LastName = formCollection["lastname"] };
                _authorService.InsertAuthor(author);
                ViewBag.Authors = _mapper.Map<List<AuthorView>>(_authorService.GetAuthors());
                return View("Create");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // POST: BookController/Create
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BookView bookView)
        {
            try
            {
                var book = _mapper.Map<Book>(bookView);
                List<Author> authors = new List<Author>();
                foreach (var item in bookView.AuthorsName)
                {
                    var nameSplit = item.Split("/");
                    authors.Add(new Author() { FirstName = nameSplit[0], LastName = nameSplit[1] });
                }
                book.Authors = authors;
                _notesService.InsertBook(book);
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex});
            }
        }
        
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        // GET: BookController/Edit/5
        public ActionResult Edit(int id)
        {
            var book = _notesService.GetNote(id) as Book;
            var bookView = _mapper.Map<BookView>(book);
            ViewBag.Authors = _mapper.Map<List<AuthorView>>(_authorService.GetAuthors());
            bookView.Authors = _mapper.Map<List<AuthorView>>(book.Authors);
            return View(bookView);
        }

        // POST: BookController/Edit/5
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BookView bookView)
        {
            try
            {
                var book = _mapper.Map<Book>(bookView);
                List<Author> authors = new List<Author>();
                foreach (var item in bookView.AuthorsName)
                {
                    var nameSplit = item.Split("/");
                    authors.Add(new Author() { FirstName = nameSplit[0], LastName = nameSplit[1] });
                }
                book.Authors = authors;
                _notesService.UpdateNote(book);
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // GET: BookController/Delete/5
        [TypeFilter(typeof(AuditLogActionFilter))]
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            var book = _notesService.GetNote(id) as Book;
            var bookView = _mapper.Map<BookView>(book);
            bookView.Authors = _mapper.Map<List<AuthorView>>(book.Authors);
            return View(bookView);
        }

        // POST: BookController/Delete/5
        [TypeFilter(typeof(AuditLogActionFilter))]
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            _notesService.RemoveNotes(id);
            return RedirectToAction("Index", "Notes");
        }
    }
}
