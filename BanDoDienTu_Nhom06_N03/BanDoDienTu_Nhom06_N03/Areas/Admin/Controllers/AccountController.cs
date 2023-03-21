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
    public class AccountController : Controller
    {
        private readonly BanDoDienTuContext _context;

        public INotyfService _notyfService { get; }

        public AccountController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/Account
        public async Task<IActionResult> Index()
        {
            var banDoDienTuContext = _context.DangNhaps.Include(d => d.Role);
            return View(await banDoDienTuContext.ToListAsync());
        }

        // GET: Admin/Account/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.DangNhaps == null)
            {
                return NotFound();
            }

            var dangNhap = await _context.DangNhaps
                .FirstOrDefaultAsync(m => m.TaiKhoan == id);
            if (dangNhap == null)
            {
                return NotFound();
            }

            return View(dangNhap);
        }

        // GET: Admin/Account/Create
        public IActionResult Create()
        {
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId");
            return View();
        }

        // POST: Admin/Account/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TaiKhoan,MatKhau,RoleId,Status,CreatedDate")] DangNhap dangNhap)
        {
            if (ModelState.IsValid)
            {
                if (_context.DangNhaps.FirstOrDefault(x => x.TaiKhoan == dangNhap.TaiKhoan) != null)
                {
                    ModelState.AddModelError("TaiKhoan", "Tài khoản đã tồn tại");
                    _notyfService.Success("Tài khoản đã tồn tại");
                }
                else if (_context.Roles.FirstOrDefault(x => x.RoleId == dangNhap.RoleId) == null)
                {
                    ModelState.AddModelError("RoleId", "Không tồn tại quyền này");
                }
                else
                {
                    _context.Add(dangNhap);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Tạo tài khoản thành công");
                    return RedirectToAction(nameof(Index));
                }
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", dangNhap.RoleId);
            return View(dangNhap);
        }

        // GET: Admin/Account/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.DangNhaps == null)
            {
                return NotFound();
            }

            var dangNhap = await _context.DangNhaps.FindAsync(id);
            if (dangNhap == null)
            {
                return NotFound();
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", dangNhap.RoleId);
            return View(dangNhap);
        }

        // POST: Admin/Account/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("TaiKhoan,MatKhau,RoleId,Status,CreatedDate")] DangNhap dangNhap)
        {
            if (id != dangNhap.TaiKhoan)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                if (_context.Roles.FirstOrDefault(x => x.RoleId == dangNhap.RoleId) == null)
                {
                    ModelState.AddModelError("RoleId", "Không tồn tại quyền này");
                }
                else
                {
                    _context.Update(dangNhap);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Sửa tài khoản thành công");
                    return RedirectToAction(nameof(Index));
                }
            }
            ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", dangNhap.RoleId);
            return View(dangNhap);
        }

        // GET: Admin/Account/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.DangNhaps == null)
            {
                return NotFound();
            }

            var dangNhap = await _context.DangNhaps
                .Include(d => d.Role)
                .FirstOrDefaultAsync(m => m.TaiKhoan == id);
            if (dangNhap == null)
            {
                return NotFound();
            }

            return View(dangNhap);
        }

        // POST: Admin/Account/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.DangNhaps == null)
            {
                return Problem("Entity set 'BanDoDienTuContext.DangNhaps'  is null.");
            }
            var dangNhap = await _context.DangNhaps.FindAsync(id);
            if (dangNhap != null)
            {
                _context.DangNhaps.Remove(dangNhap);
            }

            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa tài khoản thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool DangNhapExists(string id)
        {
          return (_context.DangNhaps?.Any(e => e.TaiKhoan == id)).GetValueOrDefault();
        }
    }
}
