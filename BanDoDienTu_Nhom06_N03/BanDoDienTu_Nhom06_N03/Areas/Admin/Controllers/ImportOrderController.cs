using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BanDoDienTu_Nhom06_N03.Models;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ImportOrderController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public ImportOrderController(BanDoDienTuContext context)
        {
            _context = context;
        }

        // GET: Admin/ImportOrder
        public async Task<IActionResult> Index()
        {
            var banDoDienTuContext = _context.HoaDonNhaps.Include(h => h.MaNccNavigation).Include(h => h.MaNvNavigation);
            return View(await banDoDienTuContext.ToListAsync());
        }

        // GET: Admin/ImportOrder/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.HoaDonNhaps == null)
            {
                return NotFound();
            }

            var hoaDonNhap = await _context.HoaDonNhaps
                .Include(h => h.MaNccNavigation)
                .Include(h => h.MaNvNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == id);
            if (hoaDonNhap == null)
            {
                return NotFound();
            }

            return View(hoaDonNhap);
        }

        // GET: Admin/ImportOrder/Create
        public IActionResult Create()
        {
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc");
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv");
            return View();
        }

        // POST: Admin/ImportOrder/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaHdn,MaNcc,NgayNhap,MaNv,TongTien")] HoaDonNhap hoaDonNhap)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hoaDonNhap);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc", hoaDonNhap.MaNcc);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonNhap.MaNv);
            return View(hoaDonNhap);
        }

        // GET: Admin/ImportOrder/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.HoaDonNhaps == null)
            {
                return NotFound();
            }

            var hoaDonNhap = await _context.HoaDonNhaps.FindAsync(id);
            if (hoaDonNhap == null)
            {
                return NotFound();
            }
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc", hoaDonNhap.MaNcc);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonNhap.MaNv);
            return View(hoaDonNhap);
        }

        // POST: Admin/ImportOrder/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaHdn,MaNcc,NgayNhap,MaNv,TongTien")] HoaDonNhap hoaDonNhap)
        {
            if (id != hoaDonNhap.MaHdn)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hoaDonNhap);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HoaDonNhapExists(hoaDonNhap.MaHdn))
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
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCaps, "MaNcc", "MaNcc", hoaDonNhap.MaNcc);
            ViewData["MaNv"] = new SelectList(_context.NhanViens, "MaNv", "MaNv", hoaDonNhap.MaNv);
            return View(hoaDonNhap);
        }

        // GET: Admin/ImportOrder/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.HoaDonNhaps == null)
            {
                return NotFound();
            }

            var hoaDonNhap = await _context.HoaDonNhaps
                .Include(h => h.MaNccNavigation)
                .Include(h => h.MaNvNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == id);
            if (hoaDonNhap == null)
            {
                return NotFound();
            }

            return View(hoaDonNhap);
        }

        // POST: Admin/ImportOrder/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.HoaDonNhaps == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.HoaDonNhaps'  is null.");
            }
            var hoaDonNhap = await _context.HoaDonNhaps.FindAsync(id);
            if (hoaDonNhap != null)
            {
                _context.HoaDonNhaps.Remove(hoaDonNhap);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HoaDonNhapExists(string id)
        {
          return (_context.HoaDonNhaps?.Any(e => e.MaHdn == id)).GetValueOrDefault();
        }
    }
}
