using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("News")]
    public class New
    {
        [Key]
        public int ID { get; set; }

        [Display(Name = "Tựa đề")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Title { get; set; }

        [Display(Name = "Trạng thái")]
        public int IsPublic { get; set; }

        [Display(Name = "Nội dung")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Content { get; set; }

        [Display(Name = "Nguồn")]
        public string Author { get; set; }

        [Column(TypeName = "Date")]
        [Display(Name = "Ngày viết")]
        public DateTime CreatedDate { get; set; }

        [Display(Name = "Loại tin tức")]
        public int NewsTypeID { get; set; }

        public virtual NewsType NewsType { get; set; }
    }
}