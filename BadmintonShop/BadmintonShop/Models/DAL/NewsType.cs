using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BadmintonShop.Models.DAL
{
    [Table("News_Type")]
    public class NewsType
    {
        [Key]
        public int ID { get; set; }

        [Display(Name = "Loại tin tức")]
        [Required(ErrorMessage = "Không được để trống")]
        public string Name { get; set; }

        [Display(Name = "Trạng thái tin tức")]
        public int Active { get; set; }

        public virtual ICollection<New> News { get; set; }
        public NewsType()
        {
            News = new HashSet<New>();
        }
    }
}