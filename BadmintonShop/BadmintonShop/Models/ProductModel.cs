using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BadmintonShop.Models
{
    public class ProductModel
    {
        public long ID { get; set; }

        public string Name { get; set; }

        public string Image { get; set; }

        public int? Quantity { get; set; }
        [AllowHtml]
        public string Detail { get; set; }

        public int? Price { get; set; }

        public string ProductCategory { get; set; }
        public DateTime CreateDate { get; set; }
    }
}