using BanDoDienTu_Nhom06_N03.Models;
using BanDoDienTu_Nhom06_N03.Models.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authentication]
    public class DoanhThuController : Controller
    {
        BanDoDienTuContext _context = null;
        public DoanhThuController()
        {
            _context = new BanDoDienTuContext();
        }

        public IActionResult Index()
        {
            return View();
        }
        public ActionResult TinhDoanhThu(int month, int year)
        {
            var doanhThu = _context.HoaDonBans
                .Where(hdb => hdb.NgayBan.Value.Month == month && hdb.NgayBan.Value.Year == year)
                .Sum(hdb => hdb.TongTien);

            ViewBag.DoanhThu = doanhThu;

            return View();
        }
    }
}
