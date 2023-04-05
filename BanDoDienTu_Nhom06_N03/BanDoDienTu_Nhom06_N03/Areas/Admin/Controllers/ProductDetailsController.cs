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
    public class ProductDetailsController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public ProductDetailsController(BanDoDienTuContext context)
        {
            _context = context;
        }

        // GET: Admin/ProductDetails
        public async Task<IActionResult> Index()
        {
              return _context.ChiTietSps != null ? 
                          View(await _context.ChiTietSps.ToListAsync()) :
                          Problem("Entity set 'BanDoDienTuContext.ChiTietSps'  is null.");
        }

        // GET: Admin/ProductDetails/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.ChiTietSps == null)
            {
                return NotFound();
            }

            var chiTietSp = await _context.ChiTietSps
                .FirstOrDefaultAsync(m => m.MaSp == id);
            if (chiTietSp == null)
            {
                return NotFound();
            }

            return View(chiTietSp);
        }

        // GET: Admin/ProductDetails/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProductDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaSp,TrongLuong,BoNho,HeDieuHanh,Camera,BaoHanh,KichThuoc,MoTa,Pin")] ChiTietSp chiTietSp)
        {
            if (ModelState.IsValid)
            {
                _context.Add(chiTietSp);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(chiTietSp);
        }

        // GET: Admin/ProductDetails/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.ChiTietSps == null)
            {
                return NotFound();
            }

            var chiTietSp = await _context.ChiTietSps.FindAsync(id);
            if (chiTietSp == null)
            {
                return NotFound();
            }
            return View(chiTietSp);
        }

        // POST: Admin/ProductDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaSp,TrongLuong,BoNho,HeDieuHanh,Camera,BaoHanh,KichThuoc,MoTa,Pin")] ChiTietSp chiTietSp)
        {
            if (id != chiTietSp.MaSp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chiTietSp);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChiTietSpExists(chiTietSp.MaSp))
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
            return View(chiTietSp);
        }

        // GET: Admin/ProductDetails/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.ChiTietSps == null)
            {
                return NotFound();
            }

            var chiTietSp = await _context.ChiTietSps
                .FirstOrDefaultAsync(m => m.MaSp == id);
            if (chiTietSp == null)
            {
                return NotFound();
            }

            return View(chiTietSp);
        }

        // POST: Admin/ProductDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.ChiTietSps == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.ChiTietSps'  is null.");
            }
            var chiTietSp = await _context.ChiTietSps.FindAsync(id);
            if (chiTietSp != null)
            {
                _context.ChiTietSps.Remove(chiTietSp);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ChiTietSpExists(string id)
        {
          return (_context.ChiTietSps?.Any(e => e.MaSp == id)).GetValueOrDefault();
        }
    }
}
