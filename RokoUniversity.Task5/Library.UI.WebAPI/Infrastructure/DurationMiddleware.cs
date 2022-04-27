using Microsoft.AspNetCore.Builder;

namespace Library.UI.WebAPI.Infrastructure
{
    public static class DurationMiddleware
    {
        public static IApplicationBuilder UseDurationLogger(this IApplicationBuilder app)
        {
            return app.UseMiddleware<DurationLogger>();
        }
    }
}
