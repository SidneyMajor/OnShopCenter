using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace OnShopCenter.Helper
{
    public class OrderDetailsTemp:Product
    {
       

        public int UserId { get; set; }

        public int Quantity { get; set; }

        public SqlMoney Total { get { return this.Price * this.Quantity; } }
        
    }
}