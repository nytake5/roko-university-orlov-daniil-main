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

namespace Library.UI.Web.Controllers
{
    public class NewspaperController : Controller
    {
        private readonly ILogger<NotesController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        public NewspaperController(ILogger<NotesController> logger, INotesService notesService, IMapper mapper)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
        }
        // GET: NewspaperController
        public ActionResult Index()
        {
            return View();
        }

        // GET: NewspaperController/Details/5
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Details(int id)
        {
            try
            {
                var newspaper = _notesService.GetNote(id) as Newspaper;
                var otherIssue = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);
                NewspaperView newspaperView = _mapper.Map<NewspaperView>(newspaper);
                newspaperView.NewspapersWithOtherView = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);
                return View(newspaperView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }

        // GET: NewspaperController/Create
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: NewspaperController/Create
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NewspaperView newspaper)
        {
            try
            {
                _notesService.InsertNewspaper(_mapper.Map<Newspaper>(newspaper));
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult CreateWithExistingEdition()
        {
            ViewBag.Editions = (_notesService.GetNewpapersExistingEditions());
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [ValidateAntiForgeryToken]
        public ActionResult CreateWithExistingEdition(NewspaperView newspaper)
        {
            try
            {
                var parseEdition = newspaper.Edition.Split("/");
                newspaper.Title = parseEdition[0];
                newspaper.Publisher = parseEdition[1];
                newspaper.PlaceOfPublication = parseEdition[2];
                var temp = _mapper.Map<Newspaper>(newspaper);
                _notesService.InsertNewspaper(temp);
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // GET: NewspaperController/Edit/5
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id)
        {
            var newspaper = _notesService.GetNote(id) as Newspaper;
            NewspaperView newspaperView = _mapper.Map<NewspaperView>(newspaper);
            return View(newspaperView);
        }

        // POST: NewspaperController/Edit/5
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NewspaperView newspaper)
        {
            try
            {
                _notesService.UpdateNote(_mapper.Map<Newspaper>(newspaper));
                return RedirectToAction("Index", "Notes");
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        // GET: NewspaperController/Delete/5
        [HttpGet]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            var newspaper = _notesService.GetNote(id) as Newspaper;
            var otherIssue = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);
            NewspaperView newspaperView = _mapper.Map<NewspaperView>(newspaper);
            newspaperView.NewspapersWithOtherView = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);

            return View(newspaperView);
        }

        // POST: NewspaperController/Delete/5
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
