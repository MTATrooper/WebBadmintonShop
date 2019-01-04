using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.Models.DAL;
using PagedList;

namespace BadmintonShop.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Product
        public ActionResult Index(string SearchTerm, int? page)
        {
            var product = from a in db.Product select a;
            if (!String.IsNullOrEmpty(SearchTerm))
            {
                product = db.Product.Include(p => p.Category).Include(p => p.Producer).Where(a => a.Name.Contains(SearchTerm) || a.Producer.Name.Contains(SearchTerm) || a.Category.Name.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            //var product = db.Product.Include(p => p.Category).Include(p => p.Producer);
            product = product.OrderByDescending(p => p.ID);
            var listProduct = product;
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return PartialView(product.ToList().ToPagedList(pageNumber,pageSize));
        }

        // GET: Admin/Product/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Product/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Category, "ID", "Name");
            ViewBag.ProducerID = new SelectList(db.Producer, "ID", "Name");
            return View();
        }

        // POST: Admin/Product/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Name,ProducerID,CategoryID,Price,IMG,Quantity,Description,TopHot,NewProduct,Active")] Product product, int? sale, DateTime? beginDate, DateTime? endDate)
        {
            if (ModelState.IsValid)
            {
                if (sale != null)
                {
                    var sales = new Sale();
                    sales.Discount = sale;
                    sales.ProductID = product.ID;
                    if (beginDate == null || endDate == null)
                    {
                        ViewBag.DateSale = "Nếu bạn đã nhập khuyến mại thì bạn phải nhập cả ngày bắt đầu và kết thúc!";
                        ViewBag.CategoryID = new SelectList(db.Category, "ID", "Name", product.CategoryID);
                        ViewBag.ProducerID = new SelectList(db.Producer, "ID", "Name", product.ProducerID);
                        return View(product);
                    }
                    else
                    {
                        db.Product.Add(product);
                        db.SaveChanges();
                        sales.Begin = (DateTime)beginDate;
                        sales.End = (DateTime)endDate;
                        db.Sale.Add(sales);
                        db.SaveChanges();
                    }
                }
                else
                {
                    db.Product.Add(product);
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Category, "ID", "Name", product.CategoryID);
            ViewBag.ProducerID = new SelectList(db.Producer, "ID", "Name", product.ProducerID);
            return View(product);
        }

        // GET: Admin/Product/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Category, "ID", "Name", product.CategoryID);
            ViewBag.ProducerID = new SelectList(db.Producer, "ID", "Name", product.ProducerID);
            return View(product);
        }

        // POST: Admin/Product/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,Name,ProducerID,CategoryID,Price,IMG,Quantity,Description,TopHot,NewProduct,Active")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Category, "ID", "Name", product.CategoryID);
            ViewBag.ProducerID = new SelectList(db.Producer, "ID", "Name", product.ProducerID);
            return View(product);
        }

        // GET: Admin/Product/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            var sale = db.Sale.Where(s => s.ProductID == id).ToList();
            foreach(var item in sale)
            {
                db.Sale.Remove(item);
                db.SaveChanges();
            }
            db.Product.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(product);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
