using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnShopCenter.Home
{
    public partial class CartPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            List<OrderDetailsTemp> orderDetailsTemps = new List<OrderDetailsTemp>();

            orderDetailsTemps = (List<OrderDetailsTemp>) Session["usercart"];

            RepeaterOrder.DataSource = orderDetailsTemps.ToList();
            RepeaterOrder.DataBind();
        }


        private void BindingRepeaterOrder()
        {

        }
    }
}