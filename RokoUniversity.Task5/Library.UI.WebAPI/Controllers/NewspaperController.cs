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

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NewspaperController : ControllerBase
    {
        private readonly ILogger<NewspaperController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        public NewspaperController(ILogger<NewspaperController> logger, INotesService notesService, IMapper mapper)
        {
            _logger = logger;
            _notesService = notesService;
            _mapper = mapper;
        }

        [HttpOptions]
        [AllowAnonymous]
        public ActionResult Details(int id)
        {
            try
            {
                var newspaper = _notesService.GetNote(id) as Newspaper;
                var otherIssue = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);
                NewspaperView newspaperView = _mapper.Map<NewspaperView>(newspaper);
                newspaperView.NewspapersWithOtherView = _notesService.FindNewspaperByTitleAndPublisher(newspaper.Title, newspaper.Publisher);
                return Ok(newspaperView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }

        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Create(NewspaperView newspaper)
        {
            try
            {
                _notesService.InsertNewspaper(_mapper.Map<Newspaper>(newspaper));
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

        [HttpDelete]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int id)
        {
            return Ok(_notesService.RemoveNotes(id));
        }
    }
}
