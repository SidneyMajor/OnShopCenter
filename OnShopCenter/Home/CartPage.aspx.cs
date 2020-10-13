using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.UI.WebControls;


namespace OnShopCenter.Home
{
    public partial class CartPage : System.Web.UI.Page
    {
        public List<OrderDetailsTemp> OrderDetailsTemps { get; set; } = new List<OrderDetailsTemp>();

        public int ProductNumber { get; set; } = 0;
        private int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlogin"] == null)
            {
                Response.Redirect("../Home/Login.aspx");
            }

            lbl_user.Text = $"Benvido {Session["userlogin"].ToString()}";
            btn_login.Text = "Logout";

            id = Convert.ToInt32(Session["userId"].ToString());
            BindingRepeaterOrder(id);



            if (OrderDetailsTemps.Count == 0 || OrderDetailsTemps == null)
            {
                btn_checkout.Enabled = false;
            }
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

        public void BindingRepeaterOrder(int id)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "GetOrderDetails",

                Connection = myConn
            };



            mycommand.Parameters.AddWithValue("@userId", id);
            myConn.Open();


            var reader = mycommand.ExecuteReader();
            SqlMoney money = 0.0m;
            while (reader.Read())
            {
                numItemInCart.Text = reader.GetInt32(7).ToString();
                lbl_total.Text = reader.GetSqlMoney(8).ToString();
                lbl_sub.Text = reader.GetSqlMoney(8).ToString();
                SqlMoney price = reader.GetSqlMoney(2);


                if (Session["userRole"].ToString() == "Reseller")
                {
                    price -= price * (SqlMoney)0.2;

                    money += price * reader.GetInt32(5);
                    lbl_sub.Text = money.ToString();
                    lbl_total.Text = money.ToString();
                }



                string base64 = string.Empty;

                if (reader[9] != null && reader[9].ToString().Length > 1)
                {
                    base64 = Convert.ToBase64String((byte[])reader[9]);
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

                OrderDetailsTemps.Add(new OrderDetailsTemp
                {
                    ProductId = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Price = price,
                    Description = reader.GetString(3),
                    Category = reader.GetString(4),
                    Quantity = reader.GetInt32(5),
                    UserId = reader.GetInt32(6),
                    ImagePath = path
                });


            }

            if (Session["userRole"].ToString() == "Reseller")
            {

            }

            reader.Close();
            myConn.Close();


            RepeaterOrder.DataSource = OrderDetailsTemps;
            RepeaterOrder.DataBind();
        }

        protected void btn_clearCart_Click(object sender, EventArgs e)
        {

            ClearCart(id);
        }


        protected void RepeaterOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string query = string.Empty;
            int productId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "btn_decrease")
            {
                query = $"Update OrderDetailTemp set quantity-=1 Where userId={id} And productId={productId} And quantity>0 ";
            }
            else if (e.CommandName == "btn_increase")
            {
                query = $"Update OrderDetailTemp set quantity+=1 Where userId={id} And productId={productId} And quantity>=0 ";
            }


            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand(query, myConn);

            try
            {
                myConn.Open();

                myCommand.ExecuteNonQuery();

            }
            catch (Exception)
            {


            }
            finally
            {
                myConn.Close();
            }

            Response.Redirect("CartPage.aspx");
        }

        protected void RepeaterOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                OrderDetailsTemp dr = (OrderDetailsTemp)e.Item.DataItem;


                ((Button)e.Item.FindControl("btn_decrease")).CommandArgument = dr.ProductId.ToString();
                ((Button)e.Item.FindControl("btn_increase")).CommandArgument = dr.ProductId.ToString();

            }
        }

        protected void btn_checkout_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand;
            foreach (var item in OrderDetailsTemps)
            {
                mycommand = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "ConfirmOrder",

                    Connection = myConn
                };

                //mycommand.Parameters.AddWithValue("@userId", 2);
                mycommand.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["userId"].ToString()));
                mycommand.Parameters.AddWithValue("@productId", item.ProductId);
                mycommand.Parameters.AddWithValue("@price", item.Price);
                mycommand.Parameters.AddWithValue("@quantity", item.Quantity);


                try
                {
                    myConn.Open();
                    mycommand.ExecuteNonQuery();
                }
                catch (Exception)
                {

                }
                finally
                {
                    myConn.Close();
                }

            }

            ClearCart(id);
        }

        private void ClearCart(int id)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "ClearCart",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@userId", id);
            myConn.Open();

            try
            {
                mycommand.ExecuteNonQuery();
                myConn.Close();
            }
            catch (Exception)
            {

                throw;
            }

            Response.Redirect("CartPage.aspx");
        }
    }
}