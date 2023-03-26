namespace BanDoDienTu_Nhom06_N03.Models
{
    [Serializable]
    public class CartItem
    {
        public SanPham Product { get; set; }
        public int Quantity { get; set; }
    }
}
