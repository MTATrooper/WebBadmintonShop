using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BadmintonShop.Models;
using BadmintonShop.Models.DAL;

namespace BadmintonShop.dao
{
    public class PRODUCTdao
    {
        DataConnect shop;
        public PRODUCTdao()
        {
            shop = new DataConnect();
        }
        public IQueryable<Product> LoaiSp(int id)
        {
            var res = (from s in shop.Product
                       where s.CategoryID == id
                       select s);
            return res;
        }
        public IQueryable<Product> LoaiHangSp(int? idcate, int? idpro)
        {
           
            var res1 = (from s in shop.Product
                            where s.CategoryID == idcate && s.ProducerID == idpro
                            orderby s.Price 
                            select s);
            var res2 = (from s in shop.Product
                            where s.CategoryID == idcate
                            orderby s.Price
                            select s);
            var res3 = (from s in shop.Product
                            where s.ProducerID == idpro
                            orderby s.Price
                            select s);
           
            if (idpro == null) return res2;
            else if (idcate == null) return res3;
            else return res1;
        }
        public IQueryable<Product> Sanpham(int id)
        {
            var res = (from s in shop.Product
                       where s.ID == id
                       select s);
            return res;
        }
        public IQueryable<Product> Hotproduct()
        {
            var res = (from s in shop.Product
                       where s.TopHot == 1
                       select s);
            return res;
        }
        public IQueryable<Product> Newproduct()
        {
            var res = (from s in shop.Product
                       where s.NewProduct == 1
                       select s);
            return res;
        }
        public ProductModel producrDetail(long id)
        {
            var products =
                      from p in shop.Product
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.IMG,
                          Quantity = p.Quantity,
                          ProductCategory = p.Category.Name,
                          Price = p.Price,
                      };                            
            var model = products.SingleOrDefault(x => x.ID == id);
            return model;
        }
    }
}