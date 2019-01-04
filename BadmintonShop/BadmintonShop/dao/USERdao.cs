using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BadmintonShop.Models.DAL;
using System.Data.Entity.Validation;
namespace BadmintonShop.dao
{
    public class USERdao
    {
        DataConnect user;
        public USERdao()
        {
            user = new DataConnect();
        }
        public Account GetUserString(string userName)
        {
            return user.Account.SingleOrDefault(x => x.Username == userName);
        }
        public Account findByUsername(string username)
        {
            var users = user.Account.SingleOrDefault(x => x.Username == username);
            return users;
        }
        public int LoginClient(string username, string password)
        {
            //trả về null nếu user không tồn tại
            var result = user.Account.SingleOrDefault(x => x.Username == username);
            if (result == null)
            {
                return -1; //tài khoản không tồn tại
            }
            else
            {
                if (result.Password == password)
                {
                    return 1; //đăng nhập thành công
                }
                else
                {
                    return 2;//mật khẩu tài khoản sai
                }                            
            }
        }
       
        public long Create(Account acc)
        {
            var check = user.Account.SingleOrDefault(x => x.Username == acc.Username);
            if (check == null)
            {        
                    acc.Permission = "Khách hàng"; 
                    acc.Active = "Kích hoạt";                
                    //  code kierm tra loi EntityValidate lỗi ràng buỗjc
                    try
                    {
                        user.Account.Add(acc);
                        user.SaveChanges();
                        // code của bạn
                    }
                    catch (DbEntityValidationException ex)
                    {
                        // Retrieve the error messages as a list of strings.
                        var errorMessages = ex.EntityValidationErrors
                                .SelectMany(x => x.ValidationErrors)
                                .Select(x => x.ErrorMessage);

                        // Join the list to a single string.
                        var fullErrorMessage = string.Join("; ", errorMessages);

                        // Combine the original exception message with the new one.
                        var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                        // Throw a new DbEntityValidationException with the improved exception message.
                        throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
                    }


                    return 1;

                }
               
            else
            {
                return -1;
            }

        }
    }
}