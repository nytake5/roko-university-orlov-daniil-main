using Library.Entities;
using Library.IServices;
using Library.UI.Web.Infrastructure;
using Library.UI.Web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Library.UI.Web.Controllers
{
    public class AccountController : Controller
    {   
        private readonly ILogger<AccountController> _logger;
        private readonly IUserService _userService;
        public AccountController(ILogger<AccountController> logger,  IUserService userService)
        {
            _logger = logger;
            _userService = userService;
        }

        [HttpGet]
        public IActionResult Login(string returnUrl = "/")
        {   
            TempData["ReturnUrl"] = returnUrl;
            return View();
        }

        [HttpPost]
        [TypeFilter(typeof(AuditLogActionFilter))]
        public async Task<ActionResult> Login(LoginModel loginModel)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            loginModel.Login = loginModel.Login.ToLower();

            if (_userService.LoginUser(new User() { Name = loginModel.Login, Password = loginModel.Password}))
            {
                var user = _userService.GetUser(loginModel.Login);
                var claims = new List<Claim>()
                {
                    new Claim(ClaimTypes.NameIdentifier, user.Name),
                    new Claim(ClaimTypes.Name, user.Name),
                    new Claim(ClaimTypes.Role, user.Role),
                    new Claim("Role", user.Role)
                };

                var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                var principal = new ClaimsPrincipal(identity);

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, new AuthenticationProperties()
                {
                    IsPersistent = false,
                });
                return Redirect(TempData["ReturnUrl"].ToString());
            }
            else
            {
                return View();
            }
        }
    }
}
