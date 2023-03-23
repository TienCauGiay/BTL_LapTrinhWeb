using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    public class ProductController : Controller
    {
        BanDoDienTuContext _context = null;

        public ProductController(BanDoDienTuContext context)
        {
            _context = context;
        }

        public IActionResult ProductByCategory(string id, int? page)
        {
            int pageSize = 16;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var products = _context.SanPhams.Where(x => x.MaDm == id).ToList();
            PagedList<SanPham> res = new PagedList<SanPham>(products, pageNumber, pageSize);
            ViewBag.MaDm = id;
            return View(res);
        }
    }
}
