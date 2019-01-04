using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("Producer")]
    public class Producer
    {
        [Key]
        public int ID { get; set; }

        [Display(Name ="Nhà sản xuất")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Name { get; set; }

        [Display(Name = "Logo nhà sản xuất")]
        [Required(ErrorMessage ="Chưa chọn ảnh")]
        public string Images { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public Producer()
        {
            Products = new HashSet<Product>();
        }
    }
}