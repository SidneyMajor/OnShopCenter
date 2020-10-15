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

        protected void Page_Load(object sender, EventArgs e)
        {
            BindigRepeaterProducts("");

            if (Session["userlogin"] != null)
            {
                lbl_user.Text = $"Benvido {Session["userlogin"].ToString()}";
                btn_login.Text = "Logout";

                int id = Convert.ToInt32(Session["userId"].ToString());
                CheckCart(id);
            }

            if (Session["anonimo"] != null)
            {
                List<OrderDetailsTemp> OrderDetailsTemps = (List<OrderDetailsTemp>)Session["anonimo"];
                numItemInCart.Text = OrderDetailsTemps.Count().ToString();
            }


            //ddl_filtro.Items.Insert(0,new ListItem ("All","0"));

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] != null)
            {

                Session.Clear();
                Response.Redirect("../Home/HomePage.aspx");
                btn_login.Text = "Login";
            }

            Response.Redirect("../Home/Login.aspx");

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

                if (reader[6] != null && reader[6].ToString().Length > 1)
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
                    ImagePath = path
                });
            }

            reader.Close();
            myConn.Close();

            var list = Products.Where(p => p.ProductName.ToLower().Contains(product));

            RepeaterProducts.DataSource = list.ToList();
            RepeaterProducts.DataBind();
        }

        protected void RepeaterProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            List<OrderDetailsTemp> OrderDetailsTemps = new List<OrderDetailsTemp>();
            if (Session["anonimo"] != null)
            {
                OrderDetailsTemps = (List<OrderDetailsTemp>)Session["anonimo"];
            }

            if (e.CommandName.Equals("btn_cart"))
            {
                if (Session["userlogin"] == null)
                {
                    var temp = new OrderDetailsTemp();

                    foreach (var item in Products)
                    {
                        if (item.ProductId.ToString() == ((Button)e.Item.FindControl("btn_cart")).CommandArgument)
                        {

                            temp.Category = item.Category;
                            temp.Description = item.Description;
                            temp.ImagePath = item.ImagePath;
                            temp.ProductId = item.ProductId;
                            temp.Price = item.Price;
                            temp.Quantity = 1;
                            temp.ProductName = item.ProductName;

                        }
                    }

                    if (temp != null)
                    {
                        if (OrderDetailsTemps.Find(o => o.ProductId == temp.ProductId) == null)
                        {
                            OrderDetailsTemps.Add(temp);
                        }
                        else
                        {
                            OrderDetailsTemps.Find(o => o.ProductId == temp.ProductId).Quantity += 1;
                        }
                    }

                    numItemInCart.Text = OrderDetailsTemps.Count().ToString();
                    Session["anonimo"] = OrderDetailsTemps;
                    //Response.Redirect("../Home/Login.aspx");
                }
                else
                {
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

                            //mycommand.Parameters.AddWithValue("@userId", 2);
                            mycommand.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["userId"].ToString()));
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

        protected void ddl_sort_TextChanged(object sender, EventArgs e)
        {
            if (ddl_sort.Text == "Nome")
            {
                var list = Products.OrderBy(p => p.ProductName);

                RepeaterProducts.DataSource = list.ToList();
                RepeaterProducts.DataBind();
            }
            else if (ddl_sort.Text == "Preço Ascendente")
            {
                var list = Products.OrderBy(p => p.Price);
                RepeaterProducts.DataSource = list.ToList();
                RepeaterProducts.DataBind();
            }
            else if (ddl_sort.Text == "Preço Descendente")
            {
                var list = Products.OrderByDescending(p => p.Price);
                RepeaterProducts.DataSource = list.ToList();
                RepeaterProducts.DataBind();
            }

        }

        //protected void ddl_filtro_TextChanged(object sender, EventArgs e)
        //{
        //    var list = Products.Where(p=>p.Category.ToLower()==ddl_filtro.SelectedItem.Text.ToLower()).OrderByDescending(p => p.Category);
        //    RepeaterProducts.DataSource = list.ToList();
        //    RepeaterProducts.DataBind();
        //}
    }
}