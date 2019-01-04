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
    public class AccountController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Account
        //[HttpPost]
        public ActionResult Index(string SearchTerm)
        {
            var acc = from a in db.Account select a;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                acc = db.Account.Where(a => a.Fullname.Contains(SearchTerm) || a.Username.Contains(SearchTerm) || a.Email.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            return View(acc.ToList());
        }

        // GET: Admin/Account/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Account.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // GET: Admin/Account/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Account/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Username,Password,Fullname,Birthday,Sex,PhoneNumber,Email,Address,Permission,Active")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Account.Add(account);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(account);
        }

        // GET: Admin/Account/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Account.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // POST: Admin/Account/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Username,Password,Fullname,Birthday,Sex,PhoneNumber,Email,Address,Permission,Active")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Entry(account).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(account);
        }

        // GET: Admin/Account/Delete/5
        [HttpPost]
        public JsonResult Delete(int? id)
        {
            Account account = db.Account.Find(id);
            if(account.Permission == "Quản trị")
            {
                return Json(new { message = "Bạn không được xóa tài khoản này!" });
            }
            db.Account.Remove(account);
            db.SaveChanges();
            return Json(new { message = "Xóa thành công!" });
        }

        // POST: Admin/Account/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Account account = db.Account.Find(id);
        //    db.Account.Remove(account);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}
        [HttpPost]
        public JsonResult DeleteBill(int? id)
        {
            Bill bill = db.Bill.Find(id);
            try
            {
                db.Bill.Remove(bill);
                db.SaveChanges();
                return Json(new { message = "Xóa thành công!" });
            }
            catch
            {
                return Json(new { message = "Không xóa được!" });
            }
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
