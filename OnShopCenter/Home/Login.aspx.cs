using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnShopCenter.Home
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "Login",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@util", username.Value);
            mycommand.Parameters.AddWithValue("@pw", Service.EncryptString(password.Value));
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
                    Session["util"] = username.Value;
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    lbl_Erro.Visible = true;
                    lbl_Erro.Text = "User or Password incorrect";
                }
            }
            catch (Exception ex)
            {
                lbl_Erro.Visible = true;               
                lbl_Erro.Text = "Erro ao fazer login. " + ex.Message;
            }
            finally
            {
                myConn.Close();
            }
        }
    }
}