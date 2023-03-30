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

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public OrderController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/Order
        public async Task<IActionResult> Index(int? page)
        {
            int pageSize = 5;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listOrder = _context.HoaDonBans.ToList();
            PagedList<HoaDonBan> res = new PagedList<HoaDonBan>(listOrder, pageNumber, pageSize);
            return View(res);
        }

        // GET: Admin/Order/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.HoaDonBans == null)
            {
                return NotFound();
            }

            var hoaDonBan = await _context.HoaDonBans.FirstOrDefaultAsync(m => m.MaHdb == id);
            if (hoaDonBan == null)
            {
                return NotFound();
            }

            return View(hoaDonBan);
        }

        // GET: Admin/Order/Create
        public IActionResult Create()
        {
            ViewData["MaKh"] = new SelectList(_context.KhachHangs, "MaKh", "MaKh");
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv");
            return View();
        }

        // POST: Admin/Order/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaHdb,NgayBan,MaKh,MaNv,TongTien")] HoaDonBan hoaDonBan)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hoaDonBan);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs, "MaKh", "MaKh", hoaDonBan.MaKh);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonBan.MaNv);
            return View(hoaDonBan);
        }

        // GET: Admin/Order/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.HoaDonBans == null)
            {
                return NotFound();
            }

            var hoaDonBan = await _context.HoaDonBans.FindAsync(id);
            if (hoaDonBan == null)
            {
                return NotFound();
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs, "MaKh", "MaKh", hoaDonBan.MaKh);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonBan.MaNv);
            return View(hoaDonBan);
        }

        // POST: Admin/Order/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaHdb,NgayBan,MaKh,MaNv,TongTien")] HoaDonBan hoaDonBan)
        {
            if (id != hoaDonBan.MaHdb)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hoaDonBan);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HoaDonBanExists(hoaDonBan.MaHdb))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaKh"] = new SelectList(_context.KhachHangs, "MaKh", "MaKh", hoaDonBan.MaKh);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonBan.MaNv);
            return View(hoaDonBan);
        }

        // GET: Admin/Order/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.HoaDonBans == null)
            {
                return NotFound();
            }

            var hoaDonBan = await _context.HoaDonBans
                .Include(h => h.MaKhNavigation)
                .Include(h => h.MaNvNavigation)
                .FirstOrDefaultAsync(m => m.MaHdb == id);
            if (hoaDonBan == null)
            {
                return NotFound();
            }

            return View(hoaDonBan);
        }

        // POST: Admin/Order/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.HoaDonBans == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.HoaDonBans'  is null.");
            }
            var hoaDonBan = await _context.HoaDonBans.FindAsync(id);
            if (hoaDonBan != null)
            {
                _context.HoaDonBans.Remove(hoaDonBan);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HoaDonBanExists(string id)
        {
          return (_context.HoaDonBans?.Any(e => e.MaHdb == id)).GetValueOrDefault();
        }
    }
}
