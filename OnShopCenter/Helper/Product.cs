using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace OnShopCenter.Helper
{
    public class Product
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public string Category { get; set; }

        public SqlMoney Price { get; set; }

        public string Description { get; set; }
    }
}