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
    public class NewsController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/News
        public ActionResult Index(string SearchTerm)
        {
            var news = from n in db.New select n;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                news = db.New.Where(n => n.Title.Contains(SearchTerm) || n.NewsType.Name.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(news.ToList());
            //var news = db.New.Include(n => n.NewsType);
            //return View(news.ToList());
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            New @new = db.New.Find(id);
            if (@new == null)
            {
                return HttpNotFound();
            }
            return View(@new);
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            ViewBag.NewsTypeID = new SelectList(db.NewType, "ID", "Name");
            return View();
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Title,IsPublic,Content,Author,CreatedDate,NewsTypeID")] New @new)
        {
            if (ModelState.IsValid)
            {
                db.New.Add(@new);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.NewsTypeID = new SelectList(db.NewType, "ID", "Name", @new.NewsTypeID);
            return View(@new);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            New @new = db.New.Find(id);
            if (@new == null)
            {
                return HttpNotFound();
            }
            ViewBag.NewsTypeID = new SelectList(db.NewType, "ID", "Name", @new.NewsTypeID);
            return View(@new);
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID,Title,IsPublic,Content,Author,CreatedDate,NewsTypeID")] New @new)
        {
            if (ModelState.IsValid)
            {
                db.Entry(@new).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NewsTypeID = new SelectList(db.NewType, "ID", "Name", @new.NewsTypeID);
            return View(@new);
        }

        // GET: Admin/News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            New @new = db.New.Find(id);
            if (@new == null)
            {
                return HttpNotFound();
            }
            db.New.Remove(@new);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(@new);
        }

        // POST: Admin/News/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    New @new = db.New.Find(id);
        //    db.New.Remove(@new);
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
