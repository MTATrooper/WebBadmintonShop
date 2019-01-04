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
    public class CategoryController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Category
        public ActionResult Index(string SearchTerm)
        {
            var cat = from c in db.Category select c;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                cat = db.Category.Where(c => c.Name.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(cat.ToList());
            //return View(db.Category.ToList());
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Category.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(category);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name")] Category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(category);
        }

        // GET: Admin/Category/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            var product = db.Product.Where(p => p.CategoryID == id).ToList();
            foreach (var item in product)
            {
                DeleteSale(item.ID);
                db.Product.Remove(item);
                db.SaveChanges();
            }
            db.Category.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(category);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        private void DeleteSale(int id)
        {
            var sale = db.Sale.Where(s => s.ProductID == id).ToList();
            foreach (var item in sale)
            {
                db.Sale.Remove(item);
                db.SaveChanges();
            }
        }
    }
}
