using BanDoDienTu_Nhom06_N03.Models;

namespace BanDoDienTu_Nhom06_N03.Repository
{
    public interface IDanhMucRepository
    {
        DanhMuc Add(DanhMuc danhMuc);
        //Để thêm vào CSDL
        DanhMuc Update(DanhMuc danhMuc);
        //Để update CSDL
        DanhMuc Delete(String maDm);
        //Để xóa CSDL
        DanhMuc GetDanhMuc(String maDm);
        //Để tìm trong CSDL
        IEnumerable<DanhMuc> GetAllDanhMuc();
        //Để lấy toàn bộ CSDL

    }
}
