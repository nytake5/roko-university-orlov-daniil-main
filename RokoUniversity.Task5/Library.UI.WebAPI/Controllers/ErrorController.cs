using Microsoft.AspNetCore.Mvc;
using System;

namespace Library.UI.WebAPI.Controllers
{
    [ApiController]
    public class ErrorController : ControllerBase
    {
        [Route("/error")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public IActionResult Error(Int32 statusCode, Exception exception = null)
        {
            if (exception == null)
            {
                return Problem("Unprocessed exception!");
            }
            return Problem(exception.Message, statusCode: statusCode, title: exception.GetType().Name, type: exception.GetType().ToString());
        }
    }
}
