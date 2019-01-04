using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("Account")]
    public class Account
    {
        [Key]
        public int ID { get; set; }

        [StringLength(50)]
        [Display(Name ="Tên đăng nhập (*)")]
        [Required(ErrorMessage ="Không được để trống")]
        public string Username { get; set; }

        [StringLength(50)]
        [Display(Name ="Mật khẩu (*)")]
        [Required(ErrorMessage ="Không được để trống")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Họ và tên(*)")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Fullname { get; set; }

        [Column(TypeName = "Date")]
        [Display(Name = "Ngày sinh")]
        public DateTime Birthday { get; set; }

        [Display(Name = "Giới tính")]
        public string Sex { get; set; }

        [Display(Name = "Số điện thoại")]
        public string PhoneNumber { get; set; }

        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Display(Name = "Quyền")]
        public string Permission { get; set; }

        [Display(Name = "Trạng thái tài khoản")]
        public string Active { get; set; }
        public virtual ICollection<Bill> Bills { get; set; }
        public Account()
        {
            Bills = new HashSet<Bill>();
        }
    }
}