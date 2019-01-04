using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BadmintonShop.Models.DAL
{
    [Table("Sale")]
    public class Sale
    {
        [Key]
        public int ID { get; set; }

        [Display(Name = "Giảm giá (%)")]
        //[Required(ErrorMessage ="Không được để trống")]
        public int? Discount { get; set; }

        [AllowHtml]
        [Display(Name = "Ngày bắt đầu")]
        [Column(TypeName = "Date")]
        [Required(ErrorMessage = "Không được để trống")]
        public DateTime Begin { get; set; }

        [AllowHtml]
        [Display(Name = "Ngày kết thúc")]
        [Column(TypeName = "Date")]
        [Required(ErrorMessage = "Không được để trống")]
        public DateTime End { get; set; }

        [Display(Name = "Sản phẩm")]
        //[Required(ErrorMessage = "Không được để trống")]
        public int? ProductID { get; set; }

        public virtual Product Product { get; set; }
    }
}