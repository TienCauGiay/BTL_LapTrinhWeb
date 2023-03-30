namespace BanDoDienTu_Nhom06_N03.Models
{
    public class OrderModel
    {
        public string MaHdb { get; set; } = null!;

        public DateTime? NgayBan { get; set; }

        public string MaKh { get; set; } = null!;

        public string MaNv { get; set; } = null!;

        public string MaSp { get; set; } = null!;

        public int? SlBan { get; set; }

        public decimal? TongTien { get; set; }


    }
}
