using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Session;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using Nancy.Json;
using AspNetCoreHero.ToastNotification.Abstractions;
using BanDoDienTu_Nhom06_N03.Models.Authentication;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    [Authentication]
    public class CartController : Controller
    {
        BanDoDienTuContext _context = null;
        public INotyfService _notyfService { get; }

        private const string GIOHANG = "GIOHANG";

        public CartController(BanDoDienTuContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        public IActionResult Index()
        {
            var giohang = HttpContext.Session.GetString(GIOHANG) ?? string.Empty;
            var cart = JsonConvert.DeserializeObject<List<CartItem>>(giohang);
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = cart;
            }
            var total = 0.0m;
            foreach (var item in list)
            {
                total += item.Quantity * item.Product.GiaSp.GetValueOrDefault(0);
            }
            ViewBag.Total = total;
            return View(list);
        }


        public IActionResult AddToCart(string masp, int quantity)
        {
            var giohang = HttpContext.Session.GetString(GIOHANG) ?? string.Empty;
            var cart = JsonConvert.DeserializeObject<List<CartItem>>(giohang);
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.MaSp == masp))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.MaSp == masp)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    // tạo mới 1 đối tượng cart item
                    var item = new CartItem();
                    var product = _context.SanPhams.SingleOrDefault(x => x.MaSp == masp);
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                var cartJson = JsonConvert.SerializeObject(list);
                HttpContext.Session.SetString(GIOHANG, cartJson);
            }
            else
            {
                // tạo mới 1 đối tượng cart item
                var item = new CartItem();
                var product = _context.SanPhams.SingleOrDefault(x => x.MaSp == masp);
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                // Gán vào session
                var cartJson = JsonConvert.SerializeObject(list);
                HttpContext.Session.SetString(GIOHANG, cartJson);
            }
            return RedirectToAction("Index");
        }

        public ActionResult Remove(string id)
        {
            var giohang = HttpContext.Session.GetString(GIOHANG) ?? string.Empty;
            var cart = JsonConvert.DeserializeObject<List<CartItem>>(giohang);

            if (cart != null)
            {
                var itemToRemove = cart.SingleOrDefault(item => item.Product.MaSp == id);

                if (itemToRemove != null)
                {
                    cart.Remove(itemToRemove);
                    var cartJson = JsonConvert.SerializeObject(cart);
                    HttpContext.Session.SetString(GIOHANG, cartJson);
                }
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Payment()
        {

            var giohang = HttpContext.Session.GetString(GIOHANG) ?? string.Empty;
            var cart = JsonConvert.DeserializeObject<List<CartItem>>(giohang);
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = cart;
            }
            var total = 0.0m;
            foreach (var item in list)
            {
                total += item.Quantity * item.Product.GiaSp.GetValueOrDefault(0);
            }
            ViewBag.Total = total;
            string user = HttpContext.Session.GetString("UserName");
            var kh = _context.KhachHangs.FirstOrDefault(x => x.MaKh == user);
            ViewBag.KhachHang = kh;
            return View(list);
        }

        [HttpGet]
        public IActionResult ConfirmPayment()
        {
            var giohang = HttpContext.Session.GetString(GIOHANG) ?? string.Empty;
            var cart = JsonConvert.DeserializeObject<List<CartItem>>(giohang);
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = cart;
            }
            var total = 0.0m;
            foreach (var item in list)
            {
                total += item.Quantity * item.Product.GiaSp.GetValueOrDefault(0);
            }
            string taiKhoan = HttpContext.Session.GetString("UserName");
            string id = taiKhoan + DateTime.Now.ToString();
            if (id.Length > 19) id = id.Substring(0, 19);
            if (_context.HoaDonBans.FirstOrDefault(x => x.MaHdb == id) != null) id += "1";
            var order = new HoaDonBan();
            order.MaHdb = id;
            order.NgayBan = DateTime.Now;
            order.MaKh = taiKhoan;
            order.MaNv = "robot";
            order.TongTien = total;
            _context.HoaDonBans.Add(order);
            _context.SaveChanges();
            try
            {
                foreach (var item in list)
                {
                    var sp = _context.SanPhams.FirstOrDefault(x => x.MaSp == item.Product.MaSp);
                    if (sp.SoLuong >= item.Quantity)
                    {
                        ChiTietHdb ct = new ChiTietHdb();
                        ct.MaHdb = id;
                        ct.MaSp = item.Product.MaSp;
                        ct.Slban = item.Quantity;
                        _context.ChiTietHdbs.Add(ct);
                        _context.SaveChanges();
                    }
                    else
                    {
                        _notyfService.Error("Số lượng sản phẩm tại cửa hàng không đủ");
                    }
                }
                HttpContext.Session.Remove("GIOHANG");
                _notyfService.Success("Đặt hàng thành công");
            }
            catch (Exception ex)
            {
                _notyfService.Error("Lỗi đặt hàng, vui lòng kiểm tra lại");
                return View();
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public IActionResult UpdateUser(string tenKH, string diaChiKH, string sdtKH)
        {
            var user = HttpContext.Session.GetString("UserName");
            var kh = _context.KhachHangs.FirstOrDefault(x => x.MaKh == user);
            kh.TenKh = tenKH;
            kh.DiaChiKh = diaChiKH;
            kh.Sdtkh = sdtKH;
            _context.KhachHangs.Update(kh);
            _context.SaveChanges();
            return RedirectToAction("Payment");
        }
    }
}

