using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;
namespace OnShopCenter.BackOffice
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlogin"] == null || Session["userRole"].ToString() != "Admin")
            {
                Response.Redirect("../Home/Login.aspx");
            }

            lbl_user.Text = $"Benvido {Session["userlogin"].ToString()}";
            btn_login.Text = "Logout";

        }


        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string query = "update myOrder set ";
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

                myConn.Open();


                query += "deliveryDate=GETDATE()'" + "' ";
                query += "WHERE orderId=" + Convert.ToInt32(((Label)e.Item.FindControl("orderIdLabel")).Text);

                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
                ((Button)e.Item.FindControl("EditButton")).Visible = false;
            }
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {

            DataRowView dr = (DataRowView)e.Item.DataItem;
            if (string.IsNullOrEmpty(dr["deliveryDate"].ToString()))
            {
                ((Button)e.Item.FindControl("EditButton")).Visible = true;
            }
            else
            {
                ((Button)e.Item.FindControl("EditButton")).Visible = false;
            }
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Home/HomePage.aspx");
            btn_login.Text = "Login";
        }
    }
}