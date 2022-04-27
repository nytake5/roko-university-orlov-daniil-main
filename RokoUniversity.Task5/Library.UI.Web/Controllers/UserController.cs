using AutoMapper;
using Library.Entities;
using Library.IServices;
using Library.UI.Web.Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Library.UI.Web.Controllers
{
    [Authorize(Roles = "Admin")]
    [TypeFilter(typeof(AuditLogActionFilter))]
    public class UserController : Controller
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
        public IActionResult Index()
        {
            var users = _userService.GetUsers();
            return View(users);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var user = _userService.GetUser(id);
            return View(user);
        }

        // POST: PatentController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User user)
        {
            try
            {
                _userService.UpdateUser(user);
                return RedirectToAction("Index", "User");
            }
            catch 
            {
                return View();
            }
        }
    }
}
