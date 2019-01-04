using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.Areas.Admin.Models;
using BadmintonShop.Models.DAL;

namespace BadmintonShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        private DataConnect db = new DataConnect();
        public ActionResult Index()
        {
            if (Request.Cookies["UserNameAdmin"] != null)
            {
                string cookieUsername = Request.Cookies["UserNameAdmin"].Value;

                //var user = dao.GetUserString(cookieUsername);//lấy user trong db ra và gáng vào cookie
                var user = db.Account.SingleOrDefault(a => a.Username == cookieUsername);
                if (user != null)//nếu cookie đó đúng là tài khoản thì 
                {
                    Session.Add("Username", user.Username);
                    Session.Add("UserID", user.ID);
                    Session.Add("UserLogin", user);
                    return RedirectToAction("Index", "Product");
                }
                return RedirectToAction("Index", "Login");

            }
            return View();
        }

        [HttpPost]
        public ActionResult Index(Login model)
        {
            if(ModelState.IsValid)
            {
                var acc = db.Account.SingleOrDefault(a => a.Username == model.Username && a.Password == model.Password && a.Permission == "Quản trị" && a.Active=="Kích hoạt");
                if (acc == null)
                {
                    ViewBag.Message = "Tên đăng nhập hoặc mật khẩu không đúng";
                    return View();
                }
                if (model.Rememberme)
                {
                    Response.Cookies["UserNameAdmin"].Value = model.Username;
                    Response.Cookies["UserNameAdmin"].Expires = DateTime.Now.AddDays(5);
                }
                Session.Add("Username", acc.Username);
                Session.Add("UserID", acc.ID);
                Session.Add("UserLogin", acc);
                return RedirectToAction("Index", "Product");
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["UserLogin"] = null;
            Session["Username"] = null;
            Session["UserID"] = null;
            if (Response.Cookies["UserNameAdmin"] != null)
            {
                Response.Cookies["UserNameAdmin"].Expires = DateTime.Now.AddDays(-1);
            }

            return View("Index");
        }

        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        //[CaptchaValidation("CaptchaCode", "registerCaptcha", "Mã xác nhập không đúng!")]
        public ActionResult ChangePassword(UserModel userModel)
        {

            Account acc = new Account();

            if (ModelState.IsValid)
            {
                var user = db.Account.SingleOrDefault(a => a.Username == userModel.Username);
                if (user != null)
                {
                    if (user.Password == userModel.Password)//nếu đúng pass của tài khoản mới cập nhập
                    {
                        user.Password = userModel.NewPassword;//Hàm cập nhập mật khẩu
                        db.SaveChanges();
                        TempData["Success"] = "Đổi mật khẩu thành công";
                        return RedirectToAction("Index", "Product");
                    }
                    else
                    {
                        TempData["Error"] = "Mật khẩu cũ không đúng";
                        return View();
                    }
                }
            }
            TempData["Error2"] = "Đổi mật khẩu thất bại";
            return View();
        }
    }
}