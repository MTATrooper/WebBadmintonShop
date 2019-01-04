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
    public class NewsTypeController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/NewsType
        public ActionResult Index(string SearchTerm)
        {
            var news = from n in db.NewType select n;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                news = db.NewType.Where(n => n.Name.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(news.ToList());
            //return View(db.NewType.ToList());
        }

        // GET: Admin/NewsType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewType.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            return View(newsType);
        }

        // GET: Admin/NewsType/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/NewsType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Active")] NewsType newsType)
        {
            if (ModelState.IsValid)
            {
                db.NewType.Add(newsType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(newsType);
        }

        // GET: Admin/NewsType/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewType.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            return View(newsType);
        }

        // POST: Admin/NewsType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Active")] NewsType newsType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newsType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newsType);
        }

        // GET: Admin/NewsType/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewType.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            db.NewType.Remove(newsType);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(newsType);
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
