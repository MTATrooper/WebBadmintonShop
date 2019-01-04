using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace BadmintonShop.Models.DAL
{
    public class DataConnect : DbContext
    {
        public DataConnect() : base("BadmintonDbconnect") { }
        public virtual DbSet<Account> Account { get; set; }
        public virtual DbSet<Bill> Bill { get; set; }
        public virtual DbSet<BillDetails> BillDetail { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<NewsType> NewType { get; set; }
        public virtual DbSet<New> New { get; set; }
        public virtual DbSet<Producer> Producer { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Sale> Sale { get; set; }
    }
}