using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Library.UI.WebAPI.Infrastructure
{
    public class DurationLogger
    {
        RequestDelegate _next;
        ILogger<DurationLogger> _logger;

        public DurationLogger(RequestDelegate next, ILogger<DurationLogger> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context)
        {
            var sw = new Stopwatch();
            sw.Start();
            await _next.Invoke(context);
            sw.Stop();
            _logger.LogInformation($"{context.Request.Path}. Duration: {sw.ElapsedMilliseconds}");
        }
    }
}
