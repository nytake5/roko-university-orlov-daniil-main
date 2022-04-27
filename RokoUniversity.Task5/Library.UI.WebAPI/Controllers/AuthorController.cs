using AutoMapper;
using Library.Entities;
using Library.IServices;
using Library.UI.WebAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AuthorController : ControllerBase
    {
        private readonly ILogger<AuthorController> _logger;
        private readonly IAuthorsService _authorsService;
        private readonly IMapper _mapper;
        public AuthorController(ILogger<AuthorController> logger, IAuthorsService authorsService, IMapper mapper)
        {
            _logger = logger;
            _authorsService = authorsService;
            _mapper = mapper;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_mapper.Map<List<AuthorView>>(_authorsService.GetAuthors()));
        }

        [HttpPost]
        public IActionResult Create(AuthorView author)
        {
            _authorsService.InsertAuthor(_mapper.Map<Author>(author));
            return Ok();
        }
    }
}
