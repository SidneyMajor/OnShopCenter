using OnShopCenter.Helper;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace OnShopCenter.Home
{
    public partial class SetNewPassword : System.Web.UI.Page
    {
        private string resposta = "";

        private int num_util;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                num_util = Convert.ToInt32(Service.DecryptString(Request.QueryString["id"].ToString()));

            }
            else
            {
                Response.Redirect("NotFound.aspx");
            }

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "CheckUser",
                Connection = myConn
            };
            SqlParameter valor = new SqlParameter
            {
                ParameterName = "@retorno",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
            };
            //add parameter output
            mycommand.Parameters.Add(valor);
            mycommand.Parameters.AddWithValue("@num", num_util);


            try
            {
                myConn.Open();
                mycommand.ExecuteNonQuery();
                resposta = Convert.ToString(mycommand.Parameters["@retorno"].Value);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                myConn.Close();
            }

            lbl_mg.Text = $"Benvindo \n {resposta}";
        }

        protected void btn_setnewpw_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "RecoverPassword",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@id", num_util);
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
                int result = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);
                if (result == 1)
                {
                    lbl_result.Text = $"Palavra-Passe Alterada com sucesso para o utilizador {resposta}!!";
                }
                else
                {
                    lbl_result.Text = "Erro ao alterar a Palavra-Passe!!";
                }
            }
            catch (Exception ex)
            {
                lbl_result.Text = ex.Message;
            }
            finally
            {
                myConn.Close();
            }

            //Response.Redirect("Login.aspx");
        }
    }
}