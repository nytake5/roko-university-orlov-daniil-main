using AutoMapper;
using Library.Entities;
using Library.IServices;
using Library.UI.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Library.UI.Web.Controllers
{
    public class NotesController : Controller
    {
        private readonly ILogger<NotesController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        public NotesController(ILogger<NotesController> logger, INotesService notesService, IMapper mapper)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
        }

        // GET: NotesController
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Index(int pg = 1)
        {

            int pageSize = 1;
            if (pg < 1)
            {
                pg = 1;
            }

            int resCount = _notesService.Count();

            var page = new PageViewModel(resCount, pg, pageSize);

            int resSkip = (pg - 1) * pageSize;

            var notes = _notesService.GetNotesSkipTake(resSkip, page.PageSize);

            ViewBag.Page = page;

            var notesView = MapToView(notes);

            return View(notesView);
        }

        private List<NoteView> MapToView(List<Notes> notes)
        {
            List<NoteView> resList = new List<NoteView>();
            foreach (var note in notes)
            {
                switch (note.GetNoteType())
                {
                    case NotesType.Book:
                        var book = note as Book;
                        var bookView = _mapper.Map<BookView>(note as Book);
                        bookView.Authors = _mapper.Map<List<AuthorView>>(book.Authors);
                        resList.Add(bookView);
                        break;
                    case NotesType.Newspaper:
                        var newspaperView = _mapper.Map<NewspaperView>(note as Newspaper);
                        resList.Add(newspaperView);
                        break;
                    case NotesType.Patent:
                        var patent = note as Patent;
                        var patentView = _mapper.Map<PatentView>(note as Patent);
                        patentView.Authors = _mapper.Map<List<AuthorView>>(patent.Authors);
                        resList.Add(patentView);
                        break;
                }
            }
            return resList;
        }

        // GET: NotesController/Details/5
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Details(int id, NotesType Type)
        {
            switch (Type)
            {
                case NotesType.Book:
                    return RedirectToAction("Details", "Book", new { id = id });
                case NotesType.Newspaper:
                    return RedirectToAction("Details", "Newspaper", new { id = id });
                case NotesType.Patent:
                    return RedirectToAction("Details", "Patent", new { id = id });
                default:
                    return RedirectToAction("Error", "Error", new { statusCode = 404 });
            }
        }

        // GET: NotesController/Edit/5
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id, NotesType Type)
        {
            try
            {
                switch (Type)
                {
                    case NotesType.Book:
                        return RedirectToAction("Edit", "Book", new { id = id });
                    case NotesType.Newspaper:
                        return RedirectToAction("Edit", "Newspaper", new { id = id });
                    case NotesType.Patent:
                        return RedirectToAction("Edit", "Patent", new { id = id });
                    default:
                        return RedirectToAction("Error", "Error", new { statusCode = 404 });
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 500, message = ex });
            }
        }

        // GET: NotesController/Delete/5
        [HttpGet]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id, NotesType Type)
        {
            try
            {
                switch (Type)
                {
                    case NotesType.Book:
                        return RedirectToAction("Delete", "Book", new { id = id });
                    case NotesType.Newspaper:
                        return RedirectToAction("Delete", "Newspaper", new { id = id });
                    case NotesType.Patent:
                        return RedirectToAction("Delete", "Patent", new { id = id });
                    default:
                        return RedirectToAction("Error", "Error", new { statusCode = 404 });
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 500, message = ex });
            }
        }
    }
}
