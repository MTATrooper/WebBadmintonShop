using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BadmintonShop.dao;
using BadmintonShop.Models.DAL;
namespace BadmintonShop.Models
{
    [Serializable]
    public class CartItem
    {
        public ProductModel ProductModel { get; set; }
        public int Quantity { get; set; }
    }
}