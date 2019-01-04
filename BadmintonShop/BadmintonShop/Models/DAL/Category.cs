using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("Category")]
    public class Category
    {
        [Key]
        public int ID { get; set; }

        [Display(Name = "Loại sản phẩm")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Name { get; set; }

        public virtual ICollection<Product> Products { get; set; }
        public Category()
        {
            Products = new HashSet<Product>();
        }
    }
}