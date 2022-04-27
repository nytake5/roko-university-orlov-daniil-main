using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Logging;
using System;

namespace Library.UI.WebAPI.Infrastructure
{
    public class AuditLogActionFilter : ActionFilterAttribute
    {
        private ILogger<AuditLogActionFilter> _logger;
        
        public AuditLogActionFilter(ILogger<AuditLogActionFilter> logger)
        {
            _logger = logger;   
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            string routeInfo = GetRouteData(filterContext.RouteData);
            bool isActionSucceeded = filterContext.Exception == null;
            string user = filterContext.HttpContext.User.Identity.Name;

            _logger.LogInformation($"ActionExecuting - {routeInfo}, Execudet successfully: {isActionSucceeded}, User: {user}, Date: {DateTime.Now.ToString()}");

            base.OnActionExecuted(filterContext);
        }

        private string GetRouteData(RouteData routeData)
        {
            var controller = routeData.Values["controller"];
            var action = routeData.Values["action"];

            return String.Format("Controller:{0}; Action:{1};", controller, action);
        }
    }
}
