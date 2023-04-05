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
    public class EmployeeController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public EmployeeController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService= notyfService;
        }

        // GET: Admin/Employee
        public async Task<IActionResult> Index(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listEmplyee = _context.NhanViens.ToList();
            PagedList<NhanVien> res = new PagedList<NhanVien>(listEmplyee, pageNumber, pageSize);
            return View(res);
        }

        // GET: Admin/Employee/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.NhanViens == null)
            {
                return NotFound();
            }

            var nhanVien = await _context.NhanViens
                .FirstOrDefaultAsync(m => m.MaNv == id);
            if (nhanVien == null)
            {
                return NotFound();
            }

            return View(nhanVien);
        }

        // GET: Admin/Employee/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Employee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaNv,HoTen,NgaySinh,Sdtnv,GioiTinh,DiaChiNv")] NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                if (_context.NhanViens.FirstOrDefault(x => x.MaNv == nhanVien.MaNv) == null)
                {
                    _context.Add(nhanVien);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Thêm mới nhân viên thành công");
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    _notyfService.Error("Mã nhân viên đã tồn tại");
                }
            }
            return View(nhanVien);
        }

        // GET: Admin/Employee/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.NhanViens == null)
            {
                return NotFound();
            }

            var nhanVien = await _context.NhanViens.FindAsync(id);
            if (nhanVien == null)
            {
                return NotFound();
            }
            return View(nhanVien);
        }

        // POST: Admin/Employee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("MaNv,HoTen,NgaySinh,Sdtnv,GioiTinh,DiaChiNv")] NhanVien nhanVien)
        {
            if (id != nhanVien.MaNv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(nhanVien);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NhanVienExists(nhanVien.MaNv))
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
            return View(nhanVien);
        }

        // GET: Admin/Employee/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.NhanViens == null)
            {
                return NotFound();
            }

            var nhanVien = await _context.NhanViens
                .FirstOrDefaultAsync(m => m.MaNv == id);
            if (nhanVien == null)
            {
                return NotFound();
            }

            return View(nhanVien);
        }

        // POST: Admin/Employee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.NhanViens == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.NhanViens'  is null.");
            }
            var hdn = _context.HoaDonNhaps.FirstOrDefault(x => x.MaNv == id);
            var hdb = _context.HoaDonBans.FirstOrDefault(x => x.MaNv == id);
            if(hdn != null || hdb != null)
            {
                _notyfService.Error("Không thể xóa nhân viên này");
                return RedirectToAction(nameof(Delete));
            }

            var nhanVien = await _context.NhanViens.FindAsync(id);
            if (nhanVien != null)
            {
                _context.NhanViens.Remove(nhanVien);
            }
            
            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool NhanVienExists(string id)
        {
          return (_context.NhanViens?.Any(e => e.MaNv == id)).GetValueOrDefault();
        }
    }
}
