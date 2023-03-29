using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Mvc;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    public class LoginController : Controller
    {
        BanDoDienTuContext _context;

        public LoginController(BanDoDienTuContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Index(DangNhap user)
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                var obj = _context.DangNhaps.Where(x => x.TaiKhoan == user.TaiKhoan && x.MatKhau == user.MatKhau).FirstOrDefault();
                if (obj != null)
                {
                    HttpContext.Session.SetString("UserName", obj.TaiKhoan.ToString());
                    if (obj.RoleId == "admin")
                    {
                        return RedirectToAction("Index", "Home", new { area = "Admin" });
                    }
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
    }
}
