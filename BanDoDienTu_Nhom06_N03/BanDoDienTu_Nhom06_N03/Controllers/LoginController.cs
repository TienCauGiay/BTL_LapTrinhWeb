using AspNetCoreHero.ToastNotification.Abstractions;
using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    public class LoginController : Controller
    {
        BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public LoginController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService= notyfService;
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
                var obj = _context.DangNhaps.FirstOrDefault(x => x.TaiKhoan == user.TaiKhoan && x.MatKhau == user.MatKhau);
                if (obj != null)
                {
                    HttpContext.Session.SetString("UserName", obj.TaiKhoan.ToString());
                    if (obj.RoleId == "admin")
                    {
                        return RedirectToAction("Index", "Home", new { area = "Admin" });
                    }
                    _notyfService.Success("Đăng nhập thành công " + HttpContext.Session.GetString("UserName"));
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    _notyfService.Success("Tên đăng nhập hoặc mật khẩu không đúng");
                    return View(user);
                }
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("UserName");
            return RedirectToAction("Index", "Login");
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(DangNhap user, string hoten, string diachi, string dienthoai)
        {
            var res = _context.DangNhaps.FirstOrDefault(x => x.TaiKhoan == user.TaiKhoan);
            if(res != null)
            {
                _notyfService.Success("Tài khoản đã tồn tại");
                return View();
            }
            else
            {
                user.RoleId = "customer";
                _context.DangNhaps.Add(user);
                var kh = new KhachHang();
                if(_context.KhachHangs.FirstOrDefault(x => x.MaKh == user.TaiKhoan) == null)
                {
                    kh.MaKh = user.TaiKhoan;
                    kh.TenKh = hoten;
                    kh.DiaChiKh = diachi;
                    kh.Sdtkh = dienthoai;
                    _context.KhachHangs.Add(kh);
                }
                _context.SaveChanges();
                _notyfService.Success("Đăng kí thành công");
                return RedirectToAction("Index", "Login");
            }
        }

        public IActionResult Forget()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Forget(DangNhap user)
        {
            var res = _context.DangNhaps.FirstOrDefault(x => x.TaiKhoan == user.TaiKhoan);
            if(res == null)
            {
                _notyfService.Success("Không tồn tại tài khoản có tên " + user.TaiKhoan);
                return View(user);
            }
            else
            {
                res.MatKhau = user.MatKhau;
                _context.SaveChanges();
                _notyfService.Success("Đổi mật khẩu thành công");
                return RedirectToAction("Index");
            }
        }
    }
}
