using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BadmintonShop.dao;
using BadmintonShop.Models;
using BadmintonShop.Models.DAL;
using System.Web.Script.Serialization;
namespace BadmintonShop.Controllers
{
    public class TestController : Controller
    {
        DataConnect model = new DataConnect();
        private const string CartSession = "CartSession";
        public ActionResult index()
        {
            return View();
        }
        public ActionResult checkout()
        {
            return View();
        }
        public ActionResult newstype()
        {
            IQueryable<NewsType> news = model.NewType;
            return View(news);
        }
        public ActionResult news()
        {
            return View();
        }
        public ActionResult catanews(int? id)
        {                   
            var ls = model.New.ToList();
            if(id != null) ls = model.New.Where(x => x.NewsTypeID == id).ToList();
            return View(ls);
        }
        public ActionResult contentnews(int id)
        {
            New pro = model.New.Find(id);
            return View(pro);
        }
        public ActionResult cart()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public ActionResult details()
        {
            return View();
        }
        public ActionResult contact()
        {
            return View();
        }
        public ActionResult checkout2(Account user)
        {
            if (ModelState.IsValid)
            {
                var db = new USERdao();
                var dao = db.Create(user);

                if (dao == 1)
                {
                    //nếu đăng kí thành công thì sẽ tự động đăg nhập 
                    TempData["Success"] = "Thêm tài khoản thành công !";
                    Login(user.Username, user.Password); //gọi hàm login 
                    //return RedirectToAction("Index", "Test");
                }
                else if (dao == -1)
                {
                    TempData["Error"] = "Tài khoản này đã tồn tại !";
                    return View("checkout2");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm tài khoản thất bại");
                }

            }
            return View();
        }
        public ActionResult productgird()
        {
            return View();
        }
       /* public ActionResult Register(Account user)
        {
            if (ModelState.IsValid)
            {          
                var db = new USERdao();
                var dao = db.Create(user);

                if (dao == 1)
                {
                    //nếu đăng kí thành công thì sẽ tự động đăg nhập 
                    TempData["Success"] = "Thêm tài khoản thành công";
                    Login(user.Username, user.Password); //gọi hàm login 
                    return RedirectToAction("Index", "Home");
                }
                else if (dao == -1)
                {
                    TempData["Error"] = "Tài khoản này đã tồn tại";
                    return View("Register");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm tài khoản thất bại");
                }

            }
            return View();
        }*/
        public ActionResult Logout()
        {
            Session["UsernameMember"] = null;
            TempData["Error"] = null;
            TempData["Success"] = null;
            return RedirectToAction("Index", "Test");
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var model = new USERdao().LoginClient(username, password);
            var user = new USERdao().GetUserString(username);
            if (model == 1)
            {
                Session["UsernameMember"] = username;
                Session["UsernameMemberID"] = user.ID;
                return RedirectToAction("Index", "Test");
            }
            else
            {
                TempData["Error"] = "Tài khoản hoặc mật khẩu không đúng !";
                return View("checkout");
            }
        }
        public ActionResult AddToCart(long productId, int quantity)
        {
            var product = new PRODUCTdao().producrDetail(productId);
            var cart = Session[CartSession];

            //nếu cart đã tồn tại
            if (cart != null)
            {
                //ép lại giở hàng đã tồn tại thành list
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.ProductModel.ID == productId))
                {
                    foreach (var item in list)
                    {
                        //nếu sản phẩm trùng tăng số lượng sản phẩm đó lên
                        if (item.ProductModel.ID == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }//nếu không chứa add mới 
                else
                {
                    //thêm mối một giỏ hàng 
                    var item = new CartItem();
                    item.ProductModel = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //gán danh sách vào session
                Session[CartSession] = list;

            }
            else//chưa tồn tại
            {
                //thêm mối một giỏ hàng 
                var item = new CartItem();
                item.ProductModel = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                //gán danh sách vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("Cart");
        }
        //Tao hoa don
        public ActionResult Success()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Payment(string shipName, string shipPhone, string shipAddress, string shipEmail,int total)
        {
            var order = new Bill();
            order.Date = DateTime.Now;
            order.Fullname = shipName;
            order.Address = shipAddress;
            order.Email = shipEmail;
            order.Phonenumber = shipPhone;
            order.Status = "Chờ xử lý";
            order.TotalPrice = total.ToString();
            order.AccountID = 2;

            //insert order

            var id = new BILLdao().Create(order);//trả về id của order
            try
            {
                var cart = (List<CartItem>)Session[CartSession];
                var db = new BILLdetailsdao();
                foreach (var item in cart)
                {
                    var orderDetail = new BillDetails();
                    orderDetail.ProductID = (int)item.ProductModel.ID;
                    orderDetail.BillID = (int)id;                   
                    orderDetail.Price = (int)item.ProductModel.Price;                  
                    orderDetail.Amount = item.Quantity;
                    db.Create(orderDetail);

                    Session[CartSession] = null;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RedirectToAction("Success", "Test");
        }

        [HttpPost]
        public ActionResult PaymentUserLogin(int total)
        {
            var username = Session["UsernameMember"];//lấy session gáng giá trị vào order
            var model = new USERdao().findByUsername(username.ToString());
            var order = new Bill();
            order.Date = DateTime.Now;
            order.Fullname = model.Fullname;
            order.Address = model.Address;
            order.Email = model.Email;
            order.Phonenumber = model.PhoneNumber;
            order.Status = "Chờ xử lý";
            order.TotalPrice = total.ToString();
            order.AccountID= model.ID;
            //insert order

            var id = new BILLdao().Create(order);//trả về id của order
            try
            {
                var cart = (List<CartItem>)Session[CartSession];
                var db = new BILLdetailsdao();
                foreach (var item in cart)
                {
                    var orderDetail = new BillDetails();
                    orderDetail.ProductID = (int)item.ProductModel.ID;
                    orderDetail.BillID = (int)id;
                    orderDetail.Price = (int)item.ProductModel.Price;
                    orderDetail.Amount = item.Quantity;
                    db.Create(orderDetail);

                    Session[CartSession] = null;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return RedirectToAction("Success", "Test");
        }
        public JsonResult Update(string cartModel)
        {
            var cart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];//lấy danh sách các sản phẩm trong giỏ hàng hiện có

            foreach (var item in sessionCart)
            {//lặp lấy sản phảm update
                var itemCart = cart.SingleOrDefault(x => x.ProductModel.ID == item.ProductModel.ID);
                if (itemCart != null)
                {
                    item.Quantity = itemCart.Quantity;
                }
            }

            return Json(new
            {
                status = true
            });
        }

        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];//lấy danh sách các sản phẩm trong giỏ hàng hiện có
            sessionCart.RemoveAll(x => x.ProductModel.ID == id);
            Session[CartSession] = sessionCart;

            return Json(new
            {
                status = true
            });
        }

    }
}