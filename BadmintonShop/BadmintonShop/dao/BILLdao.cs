using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Runtime.InteropServices.ComTypes;
using System.Linq;
using System.Web;
using BadmintonShop.Models.DAL;

namespace BadmintonShop.dao
{
    public class BILLdao
    {
        DataConnect bill = null;
        public BILLdao()
        {
            bill = new DataConnect();
        }
        public Bill Detail(long id)
        {
            var model = bill.Bill.SingleOrDefault(x => x.ID == id);
            return model;
        }
        public long Create(Bill order)
        {
            bill.Bill.Add(order);
            bill.SaveChanges();
            return order.ID;
        }
    }
}