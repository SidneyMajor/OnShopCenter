using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnShopCenter.Home
{
    public partial class HomePage : System.Web.UI.Page
    {
        public List<Product> Products { get; set; } = new List<Product>();

        public List<OrderDetailsTemp> OrderDetailsTemps { get; set; } = new List<OrderDetailsTemp>();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindigRepeaterProducts();
        }

        private void BindigRepeaterProducts()
        {
            /*string query = " select Product.productId, Product.productName,Product.price, Product.description,Product.quantity," +
                "Category.description from Product inner join Category on Category.categoryId = Product.categoryId " +
                "order by Product.productName";*/


            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "GetProduct",

                Connection = myConn
            };

            myConn.Open();


            var reader = mycommand.ExecuteReader();

            while (reader.Read()) 
            {
                Products.Add(new Product
                {
                    ProductId=reader.GetInt32(0),
                    ProductName=reader.GetString(1),
                    Price=reader.GetSqlMoney(2),
                    Description=reader.GetString(3),
                    Category=reader.GetString(5)
                });
            }

            reader.Close();
            myConn.Close();


            RepeaterProducts.DataSource = Products;
            RepeaterProducts.DataBind();
        }

        protected void RepeaterProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int n = Convert.ToInt32(addcart.Text);
            if (e.CommandName.Equals("btn_cart"))
            {
                foreach (var item in Products)
                {
                    if (item.ProductId.ToString()== ((Button)e.Item.FindControl("btn_cart")).CommandArgument)
                    {
                       
                        OrderDetailsTemp orderDetails = new OrderDetailsTemp
                        {
                            ProductId =item.ProductId,
                            ProductName=item.ProductName,
                            Category=item.Category,
                            Price=item.Price,
                            Description=item.Description,
                            Quantity=1,                            
                        };

                        if (OrderDetailsTemps.Where(o=>o.ProductId==orderDetails.ProductId).FirstOrDefault()==null)
                        {
                            OrderDetailsTemps.Add(orderDetails);
                            n += 1;
                            addcart.Text = n.ToString();
                        }
                        else
                        {
                            OrderDetailsTemps.Where(o => o.ProductId == orderDetails.ProductId).FirstOrDefault().Quantity += 1;
                        }
                       
                    }
                }

                
            }
            Session["usercart"]=OrderDetailsTemps;
        }

        protected void RepeaterProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Product dr = (Product)e.Item.DataItem;

                ((Button)e.Item.FindControl("btn_cart")).CommandArgument = dr.ProductId.ToString();

            }
        }

      
    }
}