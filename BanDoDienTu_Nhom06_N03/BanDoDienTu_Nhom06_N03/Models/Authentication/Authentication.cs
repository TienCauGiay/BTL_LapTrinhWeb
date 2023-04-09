using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace BanDoDienTu_Nhom06_N03.Models.Authentication
{
    public class Authentication : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("UserName") == null)
            {
                context.Result = new RedirectToRouteResult(
                new RouteValueDictionary
                {
                    {"Area", "" },
                    {"Controller", "Login" },
                    {"Action", "Index" }
                });
            }
            else
            {
                var dangNhap = new BanDoDienTuContext().DangNhaps.FirstOrDefault(x=>x.TaiKhoan == context.HttpContext.Session.GetString("UserName"));
                var currentRoute = context.HttpContext.Request.Path.ToString();
                if ((currentRoute.Contains("/Admin") || currentRoute.Contains("/admin")) && dangNhap.RoleId != "admin")
                {
                    context.Result = new RedirectToRouteResult(
                    new RouteValueDictionary
                    {
                        {"Area", "" },
                        {"Controller", "Login" },
                        {"Action", "NoRolesAdmin" }
                    });
                }
            }
        }
    }
}
