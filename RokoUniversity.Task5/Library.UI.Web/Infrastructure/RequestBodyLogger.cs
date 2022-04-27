using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Library.UI.Web.Infrastructure
{
    public class RequestBodyLogger
    {
        RequestDelegate _next;
        ILogger<DurationLogger> _logger;

        public RequestBodyLogger(RequestDelegate next, ILogger<DurationLogger> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context)
        {
            await _next.Invoke(context);
            StringBuilder body = new StringBuilder();
            body.Append($"{context.Request.Path} {context.Request.Method}{Environment.NewLine}");
            foreach (var header in context.Request.Headers)
            {
                body.Append($"Header: {header.Key} Value: {header.Value}{Environment.NewLine}");
            }
            foreach (var param in context.Request.Query)
            {
                body.Append($"{param.Key} = {param.Value}{Environment.NewLine}");
            }
            _logger.LogInformation(body.ToString());
        }
    }
}
