using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BadmintonShop.Models.DAL
{
    [Table("Product")]
    public class Product
    {
        [Key]
        public int ID { get; set; }

        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Name { get; set; }

        [Display(Name = "Nhà sản xuất")]
        [Required(ErrorMessage = "Bạn phải chọn nhà sản xuất")]
        public int ProducerID { get; set; }

        [Display(Name = "Danh mục")]
        [Required(ErrorMessage = "Bạn phải chọn danh mục sản phẩm")]
        public int CategoryID { get; set; }

        [Display(Name = "Giá sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public int Price { get; set; }

        [Display(Name ="Ảnh sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public string IMG { get; set; }

        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Không được để trống")]
        public int Quantity { get; set; }

        [AllowHtml]
        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Description { get; set; }

        public int TopHot { get; set; }

        public int NewProduct { get; set; }

        [Display(Name = "Trạng thái kinh doanh")]
        public string Active { get; set; }

        public virtual Producer Producer { get; set; }
        public virtual Category Category { get; set; }

        public virtual ICollection<BillDetails> Bills { get; set; }
        public virtual ICollection<Sale> sales { get; set; }
        public Product()
        {
            Bills = new HashSet<BillDetails>();
            sales = new HashSet<Sale>();
        }
    }
}