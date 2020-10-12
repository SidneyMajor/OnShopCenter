using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace OnShopCenter.Home
{
    public partial class HomePage : System.Web.UI.Page
    {
        public List<Product> Products { get; set; } = new List<Product>();

        public List<OrderDetailsTemp> OrderDetailsTemps { get; set; } = new List<OrderDetailsTemp>();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindigRepeaterProducts("");
            CheckCart(2);
            if (Session["userlogin"] != null)
            {
                var id = Convert.ToInt32(Session["userId"].ToString());
                CheckCart(id);
            }
            
        }

        private void CheckCart(int id)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "CheckCart",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@userId", id);

            SqlParameter valor = new SqlParameter
            {
                ParameterName = "@retorno",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int,
                Size = 6
            };
            //add parameter output
            mycommand.Parameters.Add(valor);

            try
            {
                myConn.Open();
                mycommand.ExecuteNonQuery();
                numItemInCart.Text = mycommand.Parameters["@retorno"].Value.ToString();
            }
            catch (Exception)
            {

            }
            finally
            {
                myConn.Close();
            }


        }

        private void BindigRepeaterProducts(string product)
        {
            /*string query = " select Product.productId, Product.productName,Product.price, Product.description,Product.quantity," +
                "Category.description from Product inner join Category on Category.categoryId = Product.categoryId " +
                "order by Product.productName";*/
            Products = new List<Product>();
            
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
                string base64 = string.Empty;
                
                if (reader[6]!=null && reader[6].ToString().Length>1)
                {
                    base64 = Convert.ToBase64String((byte[])reader[6]);
                }


                string path;
                if (string.IsNullOrEmpty(base64))
                {
                    path = "../Config/images/no-image.png";
                }
                else
                {
                    path = $"data:image/jpeg;base64,{base64}";
                }

                

                Products.Add(new Product
                {
                    ProductId = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Price = reader.GetSqlMoney(2),
                    Description = reader.GetString(3),
                    Category = reader.GetString(5),
                    ImagePath= path
                });
            }
            
            reader.Close();
            myConn.Close();

            var list= Products.Where(p => p.ProductName.ToLower().Contains(product));

            RepeaterProducts.DataSource = list.ToList();
            RepeaterProducts.DataBind();
        }

        protected void RepeaterProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName.Equals("btn_cart"))
            {
                if (Session["userlogin"] == null)
                {
                    Response.Redirect("../Home/Login.aspx");
                }
                foreach (var item in Products)
                {
                    if (item.ProductId.ToString() == ((Button)e.Item.FindControl("btn_cart")).CommandArgument)
                    {
                        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
                        SqlCommand mycommand = new SqlCommand
                        {
                            CommandType = CommandType.StoredProcedure,
                            CommandText = "AddProduct",

                            Connection = myConn
                        };

                        mycommand.Parameters.AddWithValue("@userId", 2);
                        //mycommand.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["userId"].ToString()));
                        mycommand.Parameters.AddWithValue("@productId", item.ProductId);
                        mycommand.Parameters.AddWithValue("@price", item.Price);
                        mycommand.Parameters.AddWithValue("@quantity", 1);
                        
                        SqlParameter valor = new SqlParameter
                        {
                            ParameterName = "@retorno",
                            Direction = ParameterDirection.Output,
                            SqlDbType = SqlDbType.Int,
                            Size = 6
                        };
                        //add parameter output
                        mycommand.Parameters.Add(valor);

                        try
                        {
                            myConn.Open();
                            mycommand.ExecuteNonQuery();
                            numItemInCart.Text = mycommand.Parameters["@retorno"].Value.ToString();
                        }
                        catch (Exception)
                        {

                        }
                        finally
                        {
                            myConn.Close();
                        }

                    }
                }


            }
        }

        protected void RepeaterProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Product dr = (Product)e.Item.DataItem;

                ((Button)e.Item.FindControl("btn_cart")).CommandArgument = dr.ProductId.ToString();

            }
        }

        

        protected void tb_search_input_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(tb_search_input.Text))
            {
                BindigRepeaterProducts("");

            }
            else
            {
                BindigRepeaterProducts(tb_search_input.Text.ToLower());
            }

        }
    }
}