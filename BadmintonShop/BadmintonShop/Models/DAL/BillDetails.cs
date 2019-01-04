using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("Bill_Details")]
    public class BillDetails
    {
        [Key]
        [Column(Order = 0)]
        [Display(Name = "Sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public int ProductID { get; set; }

        [Key]
        [Column(Order = 1)]
        [Display(Name = "Hóa đơn")]
        [Required(ErrorMessage = "Không được để trống")]
        public int BillID { get; set; }

        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Không được để trống")]
        public int Amount { get; set; }

        [Display(Name = "Đơn giá")]
        [Required(ErrorMessage = "Không được để trống")]
        public int Price { get; set; }

        public virtual Product Product { get; set; }
        public virtual Bill Bill { get; set; }
    }
}