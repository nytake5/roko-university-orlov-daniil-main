using Microsoft.AspNetCore.Builder;

namespace Library.UI.Web.Infrastructure
{
    public static class RequestBodyMiddleware
    {
        public static IApplicationBuilder UseRequestBodyLogger(this IApplicationBuilder app)
        {
            return app.UseMiddleware<RequestBodyLogger>();
        }
    }
}
