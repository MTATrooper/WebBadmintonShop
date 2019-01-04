using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("Bill")]
    public class Bill
    {
        [Key]
        public int ID { get; set; }

        [Column(TypeName = "Date")]
        [Display(Name = "Ngày lập")]
        [Required(ErrorMessage = "Không được để trống")]
        public DateTime Date { get; set; }

        [Display(Name = "Khách hàng")]
        [Required(ErrorMessage = "Không được để trống")]
        public int? AccountID { get; set; }

        [Display(Name = "Tên người nhận")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Fullname { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Phonenumber { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Address { get; set; }

        [Display(Name = "Emails")]
        public string Email { get; set; }

        [Display(Name = "Tổng tiền(VND)")]
        [Required(ErrorMessage = "Không được để trống")]
        public string TotalPrice { get; set; }

        [Display(Name = "Trạng thái")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Status { get; set; }
        
        public virtual ICollection<BillDetails> Bills { get; set; }
        public Bill()
        {
            Bills = new HashSet<BillDetails>();
        }
        public virtual Account Account { get; set; }
    }
}