using Microsoft.AspNetCore.Mvc;
using System;

namespace Library.UI.Web.Controllers
{
    public class ErrorController : Controller
    {
        private Int32[] _availableCodes = new Int32[] { 404, 406, 409, 418, 500 };

        public IActionResult Error(Int32 statusCode, Exception exception = null)
        {
            if (exception != null)
            {
                return View($"{statusCode}", exception);
            }
            return View($"{statusCode}");
        }
    }
}
