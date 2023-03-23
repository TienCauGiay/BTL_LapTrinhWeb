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

        public IActionResult ProductByCategory(int? page, string id)
        {
            int pageSize = 16;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var products = _context.SanPhams.Where(x => x.MaDm == id).ToList();
            PagedList<SanPham> res = new PagedList<SanPham>(products, pageNumber, pageSize);
            ViewBag.MaDm = id;
            return View(res);
        }

        public IActionResult Details(string id)
        {
            var res = from sp in _context.SanPhams
                      join ct in _context.ChiTietSps 
                      on sp.MaSp equals ct.MaSp 
                      where sp.MaSp == id
                      select new DetailsViewModel()
                      {
                          MaSp = sp.MaSp,
                          MaDm = sp.MaDm,
                          TenSp = sp.TenSp,
                          SoLuong = sp.SoLuong,
                          GiaSp = sp.GiaSp,
                          AnhSp = sp.AnhSp,
                          TrongLuong = ct.TrongLuong,
                          BoNho = ct.BoNho,
                          HeDieuHanh = ct.HeDieuHanh,
                          Camera = ct.Camera,
                          BaoHanh = ct.BaoHanh,
                          KichThuoc = ct.KichThuoc,
                          MoTa = ct.MoTa,
                          Pin = ct.Pin
                      };
            res.OrderBy(x => x.MaSp);
            var product = _context.SanPhams.FirstOrDefault(x => x.MaSp == id);
            ViewBag.SanPhamTuongTu = _context.SanPhams.Where(x => x.MaDm == product.MaDm && x.MaSp != product.MaSp).ToList();
            return View(res.ToList());
        }
    }
}
