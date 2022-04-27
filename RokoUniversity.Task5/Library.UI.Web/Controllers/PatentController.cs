using AutoMapper;
using Library.Entities;
using Library.Entities.Exceptions;
using Library.IServices;
using Library.UI.Web.Infrastructure;
using Library.UI.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Library.UI.Web.Controllers
{
    public class PatentController : Controller
    {
        private readonly ILogger<NotesController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        private readonly IAuthorsService _authorService;
        public PatentController(ILogger<NotesController> logger, INotesService notesService, IMapper mapper, IAuthorsService authorService)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
            _authorService = authorService;
        }
        // GET: PatentController
        public ActionResult Index()
        {
            return View();
        }

        // GET: PatentController/Details/5
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Details(int id)
        {
            try
            {
                var patent = _notesService.GetNote(id) as Patent;
                var patentView = _mapper.Map<PatentView>(patent);
                patentView.Authors = _mapper.Map<List<AuthorView>>(patent.Authors);
                return View(patentView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }

        // GET: PatentController/Create
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
            var author = new Author() { FirstName = formCollection["firstname"], LastName = formCollection["lastname"] };
            _authorService.InsertAuthor(author);
            ViewBag.Authors = _mapper.Map<List<AuthorView>>(_authorService.GetAuthors());
            return View("Create");
        }

        // POST: PatentController/Create
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PatentView patentView)
        {
            try
            {
                var patent = _mapper.Map<Patent>(patentView);
                List<Author> authors = new List<Author>();
                foreach (var item in patentView.AuthorsName)
                {
                    var nameSplit = item.Split("/");
                    authors.Add(new Author() { FirstName = nameSplit[0], LastName = nameSplit[1] });
                }
                patent.Authors = authors;
                _notesService.InsertPatent(patent);
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // GET: PatentController/Edit/5
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id)
        {
            var patent = _notesService.GetNote(id) as Patent;
            var patentView = _mapper.Map<PatentView>(patent);
            ViewBag.Authors = _mapper.Map<List<AuthorView>>(_authorService.GetAuthors());
            patentView.Authors = _mapper.Map<List<AuthorView>>(patent.Authors);
            return View(patentView);
        }

        // POST: PatentController/Edit/5
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PatentView patentView)
        {
            try
            {
                var patent = _mapper.Map<Patent>(patentView);
                List<Author> authors = new List<Author>();
                foreach (var item in patentView.AuthorsName)
                {
                    var nameSplit = item.Split("/");
                    authors.Add(new Author() { FirstName = nameSplit[0], LastName = nameSplit[1] });
                }
                patent.Authors = authors;
                _notesService.UpdateNote(patent);
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // GET: PatentController/Delete/5
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            var patent = _notesService.GetNote(id) as Patent;
            var patentView = _mapper.Map<PatentView>(patent);
            patentView.Authors = _mapper.Map<List<AuthorView>>(patent.Authors);
            return View(patentView);
        }

        // POST: PatentController/Delete/5
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            _notesService.RemoveNotes(id);
            return RedirectToAction("Index", "Notes");
        }
    }
}
