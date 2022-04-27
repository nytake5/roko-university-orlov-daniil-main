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
    public class PatentController : ControllerBase
    {
        private readonly ILogger<PatentController> _logger;
        private readonly INotesService _notesService;
        private readonly IMapper _mapper;
        public PatentController(ILogger<PatentController> logger, INotesService notesService, IMapper mapper)
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
                var patent = _notesService.GetNote(id) as Patent;
                var patentView = _mapper.Map<PatentView>(patent);
                patentView.Authors = _mapper.Map<List<AuthorView>>(patent.Authors);
                return Ok(patentView);
            }
            catch (NullReferenceException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 404, exception = ex });
            }
        }

        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public IActionResult Create(PatentView patentView)
        {
            try
            {
                var patent = _mapper.Map<Patent>(patentView); ;
                patent.Authors = _mapper.Map<List<Author>>(patentView.Authors);
                _notesService.InsertPatent(patent);
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
        public IActionResult Edit(PatentView patentView)
        {
            try
            {
                var patent = _mapper.Map<Patent>(patentView);
                patent.Authors = _mapper.Map<List<Author>>(patentView.Authors);
                _notesService.UpdateNote(patent);
                return Ok();
            }
            catch (UniquenessException ex)
            {
                return RedirectToAction("Error", "Error", new { statusCode = 409, exception = ex });
            }
        }

        [HttpDelete]
        [TypeFilter(typeof(AuditLogActionFilter))]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete(int id)
        {
            return Ok(_notesService.RemoveNotes(id));
        }
    }
}
