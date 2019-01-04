using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BadmintonShop.Areas.Admin.Models
{
    public class Login
    {
        [Required(ErrorMessage ="Chưa nhập tên đăng nhập")]
        public string Username { get; set; }

        [Required(ErrorMessage ="Chưa nhập mật khẩu")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public bool Rememberme { get; set; }
    }
}