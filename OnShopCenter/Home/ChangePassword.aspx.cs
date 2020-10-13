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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userRole"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            lbl_mg.Text = $"Benvindo \n {Session["util"]}";
        }

        protected void btn_changepw_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "AlterPassword",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@util", Session["util"].ToString());
            mycommand.Parameters.AddWithValue("@pwAntiga", Service.EncryptString(old_password.Value));
            mycommand.Parameters.AddWithValue("@pwNova", Service.EncryptString(new_password.Value));
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
                    lbl_result.ForeColor = Color.ForestGreen;
                        lbl_result.Text = $"Palavra-Passe Alterada com sucesso!";
                }
                else
                {
                    lbl_result.Text = "Palavra-Passe Errada!!";
                }
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