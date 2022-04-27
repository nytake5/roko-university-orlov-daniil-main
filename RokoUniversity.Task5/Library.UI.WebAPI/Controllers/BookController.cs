using AutoMapper;
using Library.Entities;
using Library.Entities.Exceptions;
using Library.IServices;
using Library.UI.WebAPI.Infrastructure;
using Library.UI.WebAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BookController : ControllerBase
    {
        private readonly ILogger<NotesController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        public BookController(ILogger<NotesController> logger, INotesService notesService, IMapper mapper)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
        }

        [HttpOptions]
        [AllowAnonymous]
        public IActionResult Details(int id)
        {
            try
            {
                var book = _notesService.GetNote(id) as Book;
                var bookView = _mapper.Map<BookView>(book);
                bookView.Authors = _mapper.Map<List<AuthorView>>(book.Authors);
                return Ok(bookView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }
        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Create(BookView bookView)
        {
            try
            {
                var book = _mapper.Map<Book>(bookView);
                book.Authors = _mapper.Map<List<Author>>(bookView.Authors);
                _notesService.InsertBook(book);
                return Ok();
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        
        [HttpPut]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(BookView bookView)
        {
            try
            {
                var book = _mapper.Map<Book>(bookView);
                book.Authors = _mapper.Map<List<Author>>(bookView.Authors);
                _notesService.UpdateNote(book);
                return Ok();
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }
        // DELETE 
        [TypeFilter(typeof(AuditLogActionFilter))]
        [HttpDelete]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            return Ok(_notesService.RemoveNotes(id));
        }
    }
}
