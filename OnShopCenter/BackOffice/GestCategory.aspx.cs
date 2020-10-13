using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;

namespace OnShopCenter.BackOffice
{
    public partial class GestCategory : System.Web.UI.Page
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

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "InsertCategory",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@name", description.Value);

            //Creat parameter output
            SqlParameter valor = new SqlParameter
            {
                ParameterName = "@retorno",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int,
                Size = 1
            };
            //add parameter output
            mycommand.Parameters.Add(valor);
            myConn.Open();
            try
            {
                mycommand.ExecuteNonQuery();
                int resposta = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);

                if (resposta == 1)
                {
                    lbl_Erro.Visible = true;
                    lbl_Erro.ForeColor = Color.ForestGreen;
                    lbl_Erro.Text = "Categoria inserido com sucesso.";
                }
                else
                {
                    lbl_Erro.Visible = true;
                    lbl_Erro.ForeColor = Color.Red;
                    lbl_Erro.Text = "Já existe um Categoria com esse Nome";
                }
            }
            catch (Exception ex)
            {
                lbl_Erro.Visible = true;
                lbl_Erro.ForeColor = Color.Red;
                lbl_Erro.Text = "Erro ao inserir o Categoria. " + ex.Message;
            }
            finally
            {
                myConn.Close();
            }

            Response.Redirect("GestCategory.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_categoryId")).Text = dr["categoryId"].ToString();
                ((TextBox)e.Item.FindControl("description")).Text = dr["description"].ToString();

                ((Button)e.Item.FindControl("btn_save")).CommandArgument = dr["categoryId"].ToString();
                ((Button)e.Item.FindControl("btn_edit")).CommandArgument = dr["categoryId"].ToString();
                ((Button)e.Item.FindControl("btn_delete")).CommandArgument = dr["categoryId"].ToString();

            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string query = "update Category set ";
            string queryApaga = "delete from Category ";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            myConn.Open();

            if (e.CommandName.Equals("btn_save"))            {
                
                query += "description='" + ((TextBox)e.Item.FindControl("description")).Text + "' ";
                query += "WHERE categoryId=" + ((Button)e.Item.FindControl("btn_save")).CommandArgument;

                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
                ((Button)e.Item.FindControl("btn_save")).Visible = false;
                ((Button)e.Item.FindControl("btn_edit")).Visible = true;
            }

            if (e.CommandName.Equals("btn_edit"))
            {               
                ((TextBox)e.Item.FindControl("description")).ReadOnly = false;
                ((Button)e.Item.FindControl("btn_save")).Visible = true;
                ((Button)e.Item.FindControl("btn_edit")).Visible = false;
            }

            if (e.CommandName.Equals("btn_delete"))
            {
                queryApaga += "WHERE categoryId=" + ((Button)e.Item.FindControl("btn_delete")).CommandArgument;
                SqlCommand myCommand = new SqlCommand(queryApaga, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
            }
        }

        protected void btn_saveall_Click(object sender, EventArgs e)
        {
            string query = "";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            myConn.Open();

            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "UPDATE Category SET ";               
                query += "description='" + ((TextBox)Repeater1.Items[i].FindControl("description")).Text + "' ";
                query += "WHERE categoryId=" + ((Label)Repeater1.Items[i].FindControl("lbl_categoryId")).Text + ";";

                ((Button)Repeater1.Items[i].FindControl("btn_save")).Visible = false;
                ((Button)Repeater1.Items[i].FindControl("btn_edit")).Visible = true;
            }

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }
    }
}