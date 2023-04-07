using BanDoDienTu_Nhom06_N03.Models.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authentication]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
