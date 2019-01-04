using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.Models.DAL;

namespace BadmintonShop.Areas.Admin.Controllers
{
    public class SaleController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Sale
        public ActionResult Index(string SearchTerm)
        {
            var sale = from s in db.Sale select s;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                sale = db.Sale.Include(s => s.Product).Where(s => s.Product.Name.Contains(SearchTerm) || s.Discount.ToString()==SearchTerm);
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(sale.ToList());
            //var sale = db.Sale.Include(s => s.Product);
            //return View(sale.ToList());
        }

        // GET: Admin/Sale/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sale sale = db.Sale.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            return View(sale);
        }

        // GET: Admin/Sale/Create
        public ActionResult Create()
        {
            ViewBag.ProductID = new SelectList(db.Product, "ID", "Name");
            return View();
        }

        // POST: Admin/Sale/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Discount,Begin,End,ProductID")] Sale sale)
        {
            if (ModelState.IsValid)
            {
                db.Sale.Add(sale);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductID = new SelectList(db.Product, "ID", "Name", sale.ProductID);
            return View(sale);
        }

        // GET: Admin/Sale/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sale sale = db.Sale.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductID = new SelectList(db.Product, "ID", "Name", sale.ProductID);
            return View(sale);
        }

        // POST: Admin/Sale/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Discount,Begin,End,ProductID")] Sale sale)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sale).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductID = new SelectList(db.Product, "ID", "Name", sale.ProductID);
            return View(sale);
        }

        // GET: Admin/Sale/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sale sale = db.Sale.Find(id);
            if (sale == null)
            {
                return HttpNotFound();
            }
            db.Sale.Remove(sale);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(sale);
        }

        // POST: Admin/Sale/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Sale sale = db.Sale.Find(id);
        //    db.Sale.Remove(sale);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

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
