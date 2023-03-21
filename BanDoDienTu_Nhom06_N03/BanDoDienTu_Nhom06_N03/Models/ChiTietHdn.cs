using System;
using System.Collections.Generic;

namespace BanDoDienTu_Nhom06_N03.Models;

public partial class ChiTietHdn
{
    public string MaHdn { get; set; } = null!;

    public string MaSp { get; set; } = null!;

    public int? Slnhap { get; set; }

    public virtual HoaDonNhap MaHdnNavigation { get; set; } = null!;

    public virtual SanPham MaSpNavigation { get; set; } = null!;
}
