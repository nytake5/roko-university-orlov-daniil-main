using AutoMapper;
using Library.Entities;
using Library.IServices;
using Library.UI.WebAPI.Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [Authorize(Roles = "Admin")]
    [TypeFilter(typeof(AuditLogActionFilter))]
    public class UserController : ControllerBase
    {
        private readonly ILogger<NotesController> _logger;
        private readonly IUserService _userService;
        private readonly IMapper _mapper;
        public UserController(ILogger<NotesController> logger, IUserService userService, IMapper mapper)
        {
            _logger = logger;
            _userService = userService;
            _mapper = mapper;
        }

        [HttpGet]
        public ActionResult Get()
        {
            return Ok(_userService.GetUsers());
        }

        [HttpOptions]
        public ActionResult Options(int id)
        {
            var user = _userService.GetUser(id);
            return Ok(user);
        }

        // POST: PatentController/Edit/5
        [HttpPut]
        public ActionResult Edit(User user)
        {
            try
            {
                _userService.UpdateUser(user);
                return Ok();
            }
            catch
            {
                return RedirectToAction("Error", "Error");
            }
        }
    }
}
