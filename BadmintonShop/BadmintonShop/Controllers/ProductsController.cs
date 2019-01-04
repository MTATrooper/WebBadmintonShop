using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.Models.DAL;
using BadmintonShop.dao;
using System.Globalization;

namespace BadmintonShop.Controllers
{
    public class ProductsController : Controller
    {
        DataConnect model = new DataConnect();
        public ActionResult Index()
        {
            ViewBag.Cate = model.Category.ToList();
            ViewBag.Pro = model.Producer.ToList();
            return View();
        }
        public ActionResult Test(int? idProducer, int? idCate, string SearchTerm)
        {
            PRODUCTdao dao = new PRODUCTdao();
            List<Product> pro = dao.LoaiHangSp(idCate, idProducer).ToList();
            ViewBag.SearchTerm = SearchTerm;
            var ls = model.Product.Where(x => x.Name.Contains(SearchTerm)).ToList();
            if ((idProducer == null) && (idCate == null))
            return View(ls);
            else return View(pro);
            //var ls = model.PRODUCTs.Where(x => x.ID_PRODUCER == idProducer && x.ID_CATEGORY == idCate).ToList();
            //return View(ls);
        }
        public ActionResult Details(int id)
        {
            Product pro = model.Product.Find(id);    
            return View(pro);
        }
        public ActionResult Producer()
        {
            IQueryable<Producer> pro = model.Producer;
            return View(pro);
        }
        public ActionResult Hotproduct()
        {
            PRODUCTdao dao = new PRODUCTdao();
            IQueryable<Product> pro = dao.Hotproduct();
            return View(pro);
        }
        public ActionResult Newproduct()
        {
            PRODUCTdao dao = new PRODUCTdao();
            IQueryable<Product> pro = dao.Newproduct();
            return View(pro);
        }
    }
}