using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using X.PagedList;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    public class HomeController : Controller
    {
        BanDoDienTuContext _context = null;

        public HomeController(BanDoDienTuContext context)
        {
            _context = context;
        }

        public IActionResult Index(int? page)
        {
            int pageSize = 16;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listProduct = _context.SanPhams.OrderBy(x => x.GiaSp).ToList();
            PagedList<SanPham> res = new PagedList<SanPham>(listProduct, pageNumber, pageSize);
            ViewBag.IsHome = true;

            return View(res);
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}