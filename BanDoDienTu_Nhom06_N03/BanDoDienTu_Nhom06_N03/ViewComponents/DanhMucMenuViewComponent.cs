using BanDoDienTu_Nhom06_N03.Repository;
using Microsoft.AspNetCore.Mvc;

namespace BanDoDienTu_Nhom06_N03.ViewComponents
{
    public class DanhMucMenuViewComponent : ViewComponent
    {
        private readonly IDanhMucRepository _danhMuc;

        public DanhMucMenuViewComponent(IDanhMucRepository danhMuc)
        {
            _danhMuc = danhMuc;
        }

        public IViewComponentResult Invoke()
        {
            var loaiSp = _danhMuc.GetAllDanhMuc().OrderBy(x => x.MaDm);
            return View(loaiSp);
        }
    }
}
