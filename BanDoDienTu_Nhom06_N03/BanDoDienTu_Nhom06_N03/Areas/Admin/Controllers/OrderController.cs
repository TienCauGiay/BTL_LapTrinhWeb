using AspNetCoreHero.ToastNotification.Abstractions;
using BanDoDienTu_Nhom06_N03.Models;
using BanDoDienTu_Nhom06_N03.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authentication]
    public class OrderController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public OrderController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        public IActionResult Index(int? page)
        {
            int pageSize = 5;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listOrder = from hdb in _context.HoaDonBans
                            join cthdb in _context.ChiTietHdbs
                            on hdb.MaHdb equals cthdb.MaHdb
                            into cthdbGroup from cthdb in cthdbGroup.DefaultIfEmpty()
                            select new OrderModel()
                            {
                                MaHdb = hdb.MaHdb,
                                NgayBan = hdb.NgayBan,
                                MaKh = hdb.MaKh,
                                MaNv = hdb.MaNv,
                                MaSp = cthdb.MaSp,
                                SlBan = cthdb.Slban,
                                TongTien = hdb.TongTien
                            };
            listOrder.OrderBy(x => x.MaHdb).Distinct().ToList();
            PagedList<OrderModel> res = new PagedList<OrderModel>(listOrder, pageNumber, pageSize);
            return View(res);
        }

        public IActionResult Details(string mahdb, string masp)
        {
            var listOrder = from hdb in _context.HoaDonBans
                            join cthdb in _context.ChiTietHdbs
                            on hdb.MaHdb equals cthdb.MaHdb
                            select new OrderModel()
                            {
                                MaHdb = hdb.MaHdb,
                                NgayBan = hdb.NgayBan,
                                MaKh = hdb.MaKh,
                                MaNv = hdb.MaNv,
                                MaSp = cthdb.MaSp,
                                SlBan = cthdb.Slban,
                                TongTien = hdb.TongTien
                            };
            listOrder.OrderBy(x => x.MaHdb).Distinct().ToList();
            var res = listOrder.FirstOrDefault(x => x.MaHdb== mahdb && x.MaSp == masp);
            return View(res);   
        }

        public IActionResult Create()
        {
            ViewData["MaKh"] = new SelectList(_context.KhachHangs.ToList(), "MaKh", "MaKh");
            ViewData["MaNv"] = new SelectList(_context.NhanViens.ToList(), "MaNv", "MaNv");
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp");
            ViewData["MaHdb"] = new SelectList(_context.HoaDonBans.ToList(), "MaHdb", "MaHdb");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateOrder(OrderModel order)
        {
            if (_context.HoaDonBans.FirstOrDefault(x => x.MaHdb == order.MaHdb) == null)
            {
                HoaDonBan h = new HoaDonBan()
                {
                    MaHdb = order.MaHdb,
                    NgayBan = DateTime.Now,
                    MaKh = order.MaKh,
                    MaNv = order.MaNv,
                    TongTien = order.TongTien
                };
                _context.HoaDonBans.Add(h);
                _context.SaveChangesAsync();
                _notyfService.Success("Thêm đơn hàng thành công");
                return RedirectToAction("Index");
            }
            else
            {
                _notyfService.Success("Mã hóa đơn đã tồn tại");
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs.ToList(), "MaKh", "MaKh");
            ViewData["MaNv"] = new SelectList(_context.NhanViens.ToList(), "MaNv", "MaNv");
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp");
            ViewData["MaHdb"] = new SelectList(_context.HoaDonBans.ToList(), "MaHdb", "MaHdb");
            return View(order);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateOrderDetails(OrderModel order)
        {
            if (_context.ChiTietHdbs.FirstOrDefault(x => x.MaHdb == order.MaHdb && x.MaSp == order.MaSp) == null)
            {
                ChiTietHdb ct = new ChiTietHdb()
                {
                    MaHdb = order.MaHdb,
                    MaSp= order.MaSp,
                    Slban = order.SlBan
                };
                _context.ChiTietHdbs.Add(ct);
                _context.SaveChangesAsync();
                _notyfService.Success("Thêm chi tiết đơn hàng thành công");
                return RedirectToAction("Index");
            }
            else
            {
                _notyfService.Success("Chi tiết đơn hàng đã tồn tại");
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs.ToList(), "MaKh", "MaKh");
            ViewData["MaNv"] = new SelectList(_context.NhanViens.ToList(), "MaNv", "MaNv");
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp");
            ViewData["MaHdb"] = new SelectList(_context.HoaDonBans.ToList(), "MaHdb", "MaHdb");
            return View(order);
        }

        public IActionResult Edit(string mahdb, string masp)
        {
            if (masp == null)
            {
                _notyfService.Success("Đơn hàng chưa có chi tiết, không sửa được");
                return RedirectToAction("Index");
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs.ToList(), "MaKh", "MaKh");
            ViewData["MaNv"] = new SelectList(_context.NhanViens.ToList(), "MaNv", "MaNv");
            var res = (from hdb in _context.HoaDonBans
                      join cthdb in _context.ChiTietHdbs
                      on hdb.MaHdb equals cthdb.MaHdb
                      where hdb.MaHdb == mahdb && cthdb.MaSp == masp
                      select new OrderModel()
                      {
                          MaHdb = hdb.MaHdb,
                          NgayBan = hdb.NgayBan,
                          MaKh = hdb.MaKh,
                          MaNv = hdb.MaNv,
                          MaSp = cthdb.MaSp,
                          SlBan = cthdb.Slban,
                          TongTien = hdb.TongTien
                      }).FirstOrDefault();
            return View(res);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditOrder(OrderModel order)
        {
            var hdb = _context.HoaDonBans.FirstOrDefault(x => x.MaHdb == order.MaHdb);
            hdb.NgayBan = order.NgayBan.HasValue ? order.NgayBan.Value : DateTime.Now;
            hdb.MaKh = order.MaKh;
            hdb.MaNv= order.MaNv;
            hdb.TongTien = order.TongTien;
            _context.Update(hdb);
            await _context.SaveChangesAsync();
            _notyfService.Success("Sửa đơn hàng thành công");
            return RedirectToAction("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditOrderDetails(OrderModel order)
        {
            var cthdb = _context.ChiTietHdbs.FirstOrDefault(x => x.MaHdb == order.MaHdb && x.MaSp == order.MaSp);
            cthdb.Slban = order.SlBan;
            _context.Update(cthdb);
            await _context.SaveChangesAsync();
            _notyfService.Success("Sửa chi tiết đơn hàng thành công");
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Delete(string mahdb, string masp)
        {
            OrderModel res = new OrderModel();
            var hdb = _context.HoaDonBans.FirstOrDefault(x => x.MaHdb == mahdb);
            if(hdb != null)
            {
                res.MaHdb = mahdb;
                res.MaSp = masp;
                res.MaKh = hdb.MaKh;
                res.MaNv= hdb.MaNv;
                res.NgayBan = hdb.NgayBan;
                res.TongTien = hdb.TongTien;
                var cthdb = _context.ChiTietHdbs.FirstOrDefault(x => x.MaHdb == mahdb && x.MaSp == masp);
                if(cthdb != null)
                {
                    res.SlBan = cthdb.Slban;
                }
            }

            return View(res);
        }

        [HttpPost, ActionName("Delete")]
        public async Task<IActionResult> DeleteConfirmed(string mahdb, string masp)
        {
            var cthdb = _context.ChiTietHdbs.Where(x => x.MaHdb == mahdb);
            if(cthdb != null )
            {
                _context.ChiTietHdbs.RemoveRange(cthdb);
            }
            var hdb = _context.HoaDonBans.FirstOrDefault(x => x.MaHdb == mahdb);
            if (hdb != null) _context.HoaDonBans.Remove(hdb);

            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa đơn hàng thành công");
            return RedirectToAction(nameof(Index));
        }
    }
}
