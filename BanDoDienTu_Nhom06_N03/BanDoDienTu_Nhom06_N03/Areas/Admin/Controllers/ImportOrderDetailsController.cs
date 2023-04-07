using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BanDoDienTu_Nhom06_N03.Models;
using AspNetCoreHero.ToastNotification.Abstractions;
using X.PagedList;
using BanDoDienTu_Nhom06_N03.Models.Authentication;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authentication]
    public class ImportOrderDetailsController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public ImportOrderDetailsController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService= notyfService;
        }

        // GET: Admin/ImportOrderDetails
        public async Task<IActionResult> Index(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listOrderDetails = _context.ChiTietHdns.ToList();
            PagedList<ChiTietHdn> res = new PagedList<ChiTietHdn>(listOrderDetails, pageNumber, pageSize);
            return View(res);
        }

        // GET: Admin/ImportOrderDetails/Details/5
        public async Task<IActionResult> Details(string mahdn, string masp)
        {
            var chiTietHdn = await _context.ChiTietHdns
                .Include(c => c.MaHdnNavigation)
                .Include(c => c.MaSpNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == mahdn && m.MaSp == masp);
            if (chiTietHdn == null)
            {
                return NotFound();
            }

            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Create
        public IActionResult Create()
        {
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps.ToList(), "MaHdn", "MaHdn");
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp");
            return View();
        }

        // POST: Admin/ImportOrderDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaHdn,MaSp,Slnhap")] ChiTietHdn chiTietHdn)
        {
            if (ModelState.IsValid)
            {
                if(_context.ChiTietHdns.FirstOrDefault(x => x.MaHdn == chiTietHdn.MaHdn && x.MaSp == chiTietHdn.MaSp) == null)
                {
                    _context.Add(chiTietHdn);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Thêm thành công");
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    _notyfService.Error("Chi tiết hóa đơn đã tồn tại");
                }
            }
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps.ToList(), "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp", chiTietHdn.MaSp);
            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Edit/5
        public async Task<IActionResult> Edit(string mahdn, string masp)
        {
            var chiTietHdn = _context.ChiTietHdns.FirstOrDefault(x => x.MaHdn == mahdn && x.MaSp == masp);
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps.ToList(), "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp", chiTietHdn.MaSp);
            return View(chiTietHdn);
        }

        // POST: Admin/ImportOrderDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string mahdn, string masp, [Bind("MaHdn,MaSp,Slnhap")] ChiTietHdn chiTietHdn)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chiTietHdn);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChiTietHdnExists(chiTietHdn.MaHdn))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                _notyfService.Success("Sửa thành công");
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps.ToList(), "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams.ToList(), "MaSp", "MaSp", chiTietHdn.MaSp);
            _notyfService.Error("Sửa không thành công");
            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Delete/5
        public async Task<IActionResult> Delete(string mahdn, string masp)
        {
            var chiTietHdn = await _context.ChiTietHdns
                .Include(c => c.MaHdnNavigation)
                .Include(c => c.MaSpNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == mahdn && m.MaSp == masp);
            if (chiTietHdn == null)
            {
                return NotFound();
            }

            return View(chiTietHdn);
        }

        // POST: Admin/ImportOrderDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string mahdn, string masp)
        {
            if (_context.ChiTietHdns == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.ChiTietHdns'  is null.");
            }
            var chiTietHdn = _context.ChiTietHdns.FirstOrDefault(x => x.MaHdn == mahdn && x.MaSp == masp);
            if (chiTietHdn != null)
            {
                _context.ChiTietHdns.Remove(chiTietHdn);
            }      
            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool ChiTietHdnExists(string id)
        {
          return (_context.ChiTietHdns?.Any(e => e.MaHdn == id)).GetValueOrDefault();
        }
    }
}
