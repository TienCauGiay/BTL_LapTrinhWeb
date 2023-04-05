using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BanDoDienTu_Nhom06_N03.Models;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace BanDoDienTu_Nhom06_N03.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProviderController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public ProviderController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService= notyfService;
        }

        // GET: Admin/Provider
        public async Task<IActionResult> Index()
        {
              return _context.NhaCungCaps != null ? 
                          View(await _context.NhaCungCaps.ToListAsync()) :
                          Problem("Entity set 'BanDoDienTuContext.NhaCungCaps'  is null.");
        }

        // GET: Admin/Provider/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.NhaCungCaps == null)
            {
                return NotFound();
            }

            var nhaCungCap = await _context.NhaCungCaps
                .FirstOrDefaultAsync(m => m.MaNcc == id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }

            return View(nhaCungCap);
        }

        // GET: Admin/Provider/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Provider/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaNcc,TenNcc,Sdtncc,DiaChiNcc")] NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                if(_context.NhaCungCaps.FirstOrDefault(x => x.MaNcc == nhaCungCap.MaNcc) == null)
                {
                    _context.Add(nhaCungCap);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Thêm thành công");
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    _notyfService.Error("Mã nhà cung cấp đã tồn tại");
                }
            }
            return View(nhaCungCap);
        }

        // GET: Admin/Provider/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.NhaCungCaps == null)
            {
                return NotFound();
            }

            var nhaCungCap = await _context.NhaCungCaps.FindAsync(id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }
            return View(nhaCungCap);
        }

        // POST: Admin/Provider/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaNcc,TenNcc,Sdtncc,DiaChiNcc")] NhaCungCap nhaCungCap)
        {
            if (id != nhaCungCap.MaNcc)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(nhaCungCap);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NhaCungCapExists(nhaCungCap.MaNcc))
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
            _notyfService.Error("Sửa không thành công");
            return View(nhaCungCap);
        }

        // GET: Admin/Provider/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.NhaCungCaps == null)
            {
                return NotFound();
            }

            var nhaCungCap = await _context.NhaCungCaps
                .FirstOrDefaultAsync(m => m.MaNcc == id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }

            return View(nhaCungCap);
        }

        // POST: Admin/Provider/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.NhaCungCaps == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.NhaCungCaps'  is null.");
            }
            var hdn = _context.HoaDonNhaps.FirstOrDefault(x => x.MaNcc == id);
            if(hdn == null)
            {
                var nhaCungCap = await _context.NhaCungCaps.FindAsync(id);
                if (nhaCungCap != null)
                {
                    _context.NhaCungCaps.Remove(nhaCungCap);
                }

                await _context.SaveChangesAsync();
                _notyfService.Success("Xóa thành công");
                return RedirectToAction(nameof(Index));
            }
            else
            {
                _notyfService.Error("Xóa không thành công");
            }
            return RedirectToAction(nameof(Delete));
        }

        private bool NhaCungCapExists(string id)
        {
          return (_context.NhaCungCaps?.Any(e => e.MaNcc == id)).GetValueOrDefault();
        }
    }
}
