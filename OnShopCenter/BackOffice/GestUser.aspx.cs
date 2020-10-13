using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnShopCenter.BackOffice
{
    public partial class GestUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlogin"] == null || Session["userRole"].ToString() != "Admin")
            {
                Response.Redirect("../Home/Login.aspx");
            }

            lbl_user.Text = $"Benvido {Session["userlogin"].ToString()}";
            btn_login.Text = "Logout";

            BindigRepeaterUsers();
        }

      

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_userId")).Text = dr["userId"].ToString();
                ((TextBox)e.Item.FindControl("fullname")).Text = dr["fullName"].ToString();
                ((TextBox)e.Item.FindControl("taxnumber")).Text = dr["taxNumber"].ToString();
                ((TextBox)e.Item.FindControl("dateofbirth")).Text = dr["datanasc"].ToString();
                ((TextBox)e.Item.FindControl("email")).Text = dr["email"].ToString();
                ((TextBox)e.Item.FindControl("role")).Text = dr["roleName"].ToString();
                ((CheckBox)e.Item.FindControl("ative")).Checked = Convert.ToBoolean(dr["ativo"]);

            }
        }

       

        protected void btn_saveall_Click(object sender, EventArgs e)
        {
            string query = "";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            myConn.Open();

            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "UPDATE myUser SET ";
                query += "ativo='" + ((CheckBox)Repeater1.Items[i].FindControl("ative")).Checked + "' ";
                query += "WHERE userId=" + ((Label)Repeater1.Items[i].FindControl("lbl_userId")).Text + ";";


                hl_recuperar.NavigateUrl = "https://localhost:44383/Home/HomePage.aspx";

                string htmltext = $"Caro cliente <b>{((TextBox)Repeater1.Items[i].FindControl("fullname")).Text}</b> a sua conta esta confirmada como revendedor." +
                   $"Coemeçe a sua compara <a href=\"{hl_recuperar.NavigateUrl}\">Clique aqui</a>";


                Service.Send("Confimação de Conta", htmltext, ((TextBox)Repeater1.Items[i].FindControl("email")).Text);

            }

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }


        private void BindigRepeaterUsers()
        {
            /*string query = " select Product.productId, Product.productName,Product.price, Product.description,Product.quantity," +
                "Category.description from Product inner join Category on Category.categoryId = Product.categoryId " +
                "order by Product.productName";*/
            List<User> users = new List<User>();

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "ListUserCustumer",

                Connection = myConn
            };

            myConn.Open();


            var reader = mycommand.ExecuteReader();

            while (reader.Read())
            {
                users.Add(new User
                {
                    UserId = reader.GetInt32(0),
                    FullName = reader.GetString(1),
                    TaxNumber = reader.GetString(2),
                    DateOfBirth = reader.GetDateTime(3).ToShortDateString(),
                    Email = reader.GetString(4),
                    IsActive = reader.GetBoolean(5),
                    RoleName = reader.GetString(6)
                });
            }

            reader.Close();
            myConn.Close();


            RepeaterUsers.DataSource = users;
            RepeaterUsers.DataBind();
        }



        protected void RepeaterUsers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                User dr = (User)e.Item.DataItem;

                ((Button)e.Item.FindControl("btn_edit")).CommandArgument = dr.UserId.ToString();
                ((Button)e.Item.FindControl("btn_delete")).CommandArgument = dr.UserId.ToString();

            }
        }



        protected void RepeaterUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string queryApaga = "delete from myUser";
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            if (e.CommandName.Equals("btn_edit"))
            {
                Session["edituserId"] = ((Button)e.Item.FindControl("btn_edit")).CommandArgument;
                Response.Redirect("EditUser.aspx");
            }

            if (e.CommandName.Equals("btn_delete"))
            {
                try
                {

                    queryApaga += "WHERE userId=" + ((Button)e.Item.FindControl("btn_delete")).CommandArgument;

                    SqlCommand myCommand = new SqlCommand(queryApaga, myConn);
                    myCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write("Error to delete user. " + ex.Message);
                }
                finally
                {
                    myConn.Close();
                }
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
    }
}