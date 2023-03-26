using BanDoDienTu_Nhom06_N03.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Session;
using Microsoft.AspNetCore.Http;

namespace BanDoDienTu_Nhom06_N03.Controllers
{
    public class CartController : Controller
    {
        BanDoDienTuContext _context = null;

        private const string GIOHANG = "GIOHANG";

        public CartController(BanDoDienTuContext context)
        {
            _context = context;
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

        public IActionResult Payment()
        {
            return View();
        }
    }
}
