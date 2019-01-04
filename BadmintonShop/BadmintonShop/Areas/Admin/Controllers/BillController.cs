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
    public class BillController : Controller
    {
        private DataConnect db = new DataConnect();

        // GET: Admin/Bill
        public ActionResult Index(string SearchTerm)
        {
            var bill = from b in db.Bill select b;

            if (!String.IsNullOrEmpty(SearchTerm))
            {
                bill = db.Bill.Include(b => b.Account).Where(b => b.Account.Username.Contains(SearchTerm) || b.Fullname.Contains(SearchTerm) || b.Address.Contains(SearchTerm) || b.Status.Contains(SearchTerm));
            }
            ViewBag.SearchTerm = SearchTerm;
            List<string> status = new List<string> { "--Chọn trạng thái đơn hàng--", "Chờ xử lý", "Đang giao hàng", "Đã nhận hàng", "Đã hủy" };
            ViewBag.Status = new SelectList(status);
            return View(bill.ToList());
            //var bill = db.Bill.Include(b => b.Account);
            //return View(bill.ToList());
        }

        // GET: Admin/Bill/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Bill bill = db.Bill.Find(id);
        //    if (bill == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.AccountID = new SelectList(db.Account, "ID", "Username", bill.AccountID);
        //    return View(bill);
        //}

        // POST: Admin/Bill/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Edit(FormCollection formcollection)
        {
            if (ModelState.IsValid)
            {
                var lstID = formcollection["ID"].ToString().Split(new char[] { ',' });
                foreach(var id in lstID)
                {
                    var bill = db.Bill.Find(int.Parse(id));
                    if(bill.Status == "Đã hủy")
                    {
                        ViewBag.Errorstatus = "Không thể chuyển từ đã hủy sang trạng thái khác";
                        return RedirectToAction("Index");
                    }
                    bill.Status = formcollection["Status"];
                    db.Entry(bill).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            //ViewBag.AccountID = new SelectList(db.Account, "ID", "Username", bill.AccountID);
            return RedirectToAction("Index");
        }

        // GET: Admin/Bill/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bill.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            db.Bill.Remove(bill);
            db.SaveChanges();
            return RedirectToAction("Index");
            //return View(bill);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult BillDetail(int? id)
        {
            var bill = db.BillDetail.Include(b => b.Product).Include(b => b.Bill).Where(b => b.BillID == id);
            ViewBag.Bill = id;
            return View(bill);
        }
    }
}
