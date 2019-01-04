using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BadmintonShop.Models.DAL;
namespace BadmintonShop.dao
{
    public class BILLdetailsdao
    {
        DataConnect dt;
        public BILLdetailsdao()
        {
            dt = new DataConnect();
        }
        //Lấy danh sách các sản phẩn của đơn hàng
        public IEnumerable<BillDetails> GetDetailOrder(long billID)
        {
            IQueryable<BillDetails> orders = dt.BillDetail.Where(x => x.BillID == billID);
            return orders;
        }

        //Insert order
        public bool Create(BillDetails billDetail)
        {
            try
            {
                //giảm số lượng khi đặt sản phẩm
                var product = dt.Product.Find(billDetail.ProductID);
                product.Quantity = product.Quantity - billDetail.Amount;
                dt.BillDetail.Add(billDetail);
                dt.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }
    }
}