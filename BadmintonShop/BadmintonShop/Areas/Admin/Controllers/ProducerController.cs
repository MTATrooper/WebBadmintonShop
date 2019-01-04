using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.Models.DAL;
using System.IO;

namespace BadmintonShop.Areas.Admin.Controllers
{
    public class ProducerController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Producer
        public ActionResult Index(string SearchTerm)
        {
            var pro = from p in db.Producer select p;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                pro = db.Producer.Where(a => a.Name.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(pro.ToList());
            //return View(db.Producer.ToList());
        }

        // GET: Admin/Producer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Producer/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Images")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Producer.Add(producer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(producer);
        }

        // GET: Admin/Producer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producer.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        // POST: Admin/Producer/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Images")] Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(producer);
        }

        // GET: Admin/Producer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Producer producer = db.Producer.Find(id);
            if (producer == null)
            {
                return HttpNotFound();
            }
            var product = db.Product.Where(p => p.ProducerID == id).ToList();
            foreach(var item in product)
            {
                DeleteSale(item.ID);
                db.Product.Remove(item);
                db.SaveChanges();
            }
            db.Producer.Remove(producer);
            db.SaveChanges();
            //FileInfo file = new FileInfo(Server.MapPath("~/") + producer.Images.Substring(1));
            //file.Delete();
            return RedirectToAction("Index");
            //return View(producer);
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
            foreach(var item in sale)
            {
                db.Sale.Remove(item);
                db.SaveChanges();
            }
        }
    }
}
