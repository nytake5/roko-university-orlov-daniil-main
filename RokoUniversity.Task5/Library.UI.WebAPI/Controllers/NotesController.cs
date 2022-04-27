using AutoMapper;
using Library.Entities;
using Library.IServices;
using Library.UI.WebAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NotesController : ControllerBase
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

        [HttpGet]
        [AllowAnonymous]
        public  IActionResult Get()
        {
            var notesView = MapToView(_notesService.GetNotes());
            return Ok(notesView);
        }

        [AllowAnonymous]
        [HttpGet("pageNum&pageSize")]
        public IActionResult GetPage(int pageSize, int pageNum = 1)
        {
            if (pageNum < 1)
            {
                pageNum = 1;
            }

            int resCount = _notesService.Count();

            int resSkip = (pageNum - 1) * pageSize;

            var notes = _notesService.GetNotesSkipTake(resSkip, pageSize);
            var notesView = MapToView(notes);
            
            return Ok(new { 
                body = notesView,
                size = resCount,
            });
        }

        [AllowAnonymous]
        [HttpGet("title&pageNum&pageSize")]
        public IActionResult GetPageWithFind(string title, int pageSize, int pageNum = 1)
        {
            if (pageNum < 1)
            {
                pageNum = 1;
            }


            int resCount = _notesService.FindByTitle(title).Count;

            int resSkip = (pageNum - 1) * pageSize;

            var notes = _notesService.FindByTitleSkipTake(title, resSkip, pageSize);
            var notesView = MapToView(notes);

            return Ok(new
            {
                body = notesView,
                size = resCount,
            });
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
    }
}
