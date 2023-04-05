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
    public class ImportOrderDetailsController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public ImportOrderDetailsController(BanDoDienTuContext context)
        {
            _context = context;
        }

        // GET: Admin/ImportOrderDetails
        public async Task<IActionResult> Index()
        {
            var banDoDienTuContext = _context.ChiTietHdns.Include(c => c.MaHdnNavigation).Include(c => c.MaSpNavigation);
            return View(await banDoDienTuContext.ToListAsync());
        }

        // GET: Admin/ImportOrderDetails/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.ChiTietHdns == null)
            {
                return NotFound();
            }

            var chiTietHdn = await _context.ChiTietHdns
                .Include(c => c.MaHdnNavigation)
                .Include(c => c.MaSpNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == id);
            if (chiTietHdn == null)
            {
                return NotFound();
            }

            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Create
        public IActionResult Create()
        {
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps, "MaHdn", "MaHdn");
            ViewData["MaSp"] = new SelectList(_context.SanPhams, "MaSp", "MaSp");
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
                _context.Add(chiTietHdn);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps, "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams, "MaSp", "MaSp", chiTietHdn.MaSp);
            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.ChiTietHdns == null)
            {
                return NotFound();
            }

            var chiTietHdn = await _context.ChiTietHdns.FindAsync(id);
            if (chiTietHdn == null)
            {
                return NotFound();
            }
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps, "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams, "MaSp", "MaSp", chiTietHdn.MaSp);
            return View(chiTietHdn);
        }

        // POST: Admin/ImportOrderDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaHdn,MaSp,Slnhap")] ChiTietHdn chiTietHdn)
        {
            if (id != chiTietHdn.MaHdn)
            {
                return NotFound();
            }

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
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaHdn"] = new SelectList(_context.HoaDonNhaps, "MaHdn", "MaHdn", chiTietHdn.MaHdn);
            ViewData["MaSp"] = new SelectList(_context.SanPhams, "MaSp", "MaSp", chiTietHdn.MaSp);
            return View(chiTietHdn);
        }

        // GET: Admin/ImportOrderDetails/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.ChiTietHdns == null)
            {
                return NotFound();
            }

            var chiTietHdn = await _context.ChiTietHdns
                .Include(c => c.MaHdnNavigation)
                .Include(c => c.MaSpNavigation)
                .FirstOrDefaultAsync(m => m.MaHdn == id);
            if (chiTietHdn == null)
            {
                return NotFound();
            }

            return View(chiTietHdn);
        }

        // POST: Admin/ImportOrderDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.ChiTietHdns == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.ChiTietHdns'  is null.");
            }
            var chiTietHdn = await _context.ChiTietHdns.FindAsync(id);
            if (chiTietHdn != null)
            {
                _context.ChiTietHdns.Remove(chiTietHdn);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ChiTietHdnExists(string id)
        {
          return (_context.ChiTietHdns?.Any(e => e.MaHdn == id)).GetValueOrDefault();
        }
    }
}
