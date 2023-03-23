using BanDoDienTu_Nhom06_N03.Models;

namespace BanDoDienTu_Nhom06_N03.Repository
{
    public class DanhMucRepository : IDanhMucRepository
    {
        private BanDoDienTuContext _context;
        public DanhMucRepository(BanDoDienTuContext context)
        {
            _context = context;
        }

        public DanhMuc Add(DanhMuc danhMuc)
        {
            _context.DanhMucs.Add(danhMuc);
            _context.SaveChanges();
            return danhMuc;
        }

        public DanhMuc Delete(string maDm)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DanhMuc> GetAllDanhMuc()
        {
            return _context.DanhMucs;
        }

        public DanhMuc GetDanhMuc(string maDm)
        {
            return _context.DanhMucs.Find(maDm);
        }

        public DanhMuc Update(DanhMuc danhMuc)
        {
            _context.Update(danhMuc);
            _context.SaveChanges();
            return danhMuc;
        }
    }
}
