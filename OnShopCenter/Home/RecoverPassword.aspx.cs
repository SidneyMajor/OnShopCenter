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
    public partial class RecoverPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_recoverpw_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "Getuser",
                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@email", email.Value);
            //Creat parameter output
            SqlParameter valor = new SqlParameter
            {
                ParameterName = "@retorno",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int,
                Size = 1
            };

            SqlParameter valor2 = new SqlParameter
            {
                ParameterName = "@retorno_num",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int,
                Size = 6
            };
            //add parameter output
            mycommand.Parameters.Add(valor);
            mycommand.Parameters.Add(valor2);

           

            try
            {
                myConn.Open();
                mycommand.ExecuteNonQuery();
                int resposta = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);
                int resposta_num = Convert.ToInt32(mycommand.Parameters["@retorno_num"].Value);
                if (resposta != 0)
                {
                    lbl_result.Visible = true;
                    lbl_result.ForeColor = Color.Green;
                    lbl_result.Text = "Email de Recuperação enviado com sucesso! ";
                    hl_recuperar.NavigateUrl = "https://localhost:44383/Home/SetNewPassword.aspx?id=" + Service.EncryptString(resposta_num.ToString());
                    string htmlText = $"Para recuperar a sua conta. <a href=\"{hl_recuperar.NavigateUrl}\">Clique aqui</a>";
                    Service.Send("Recuperação de Passe", htmlText, email.Value);
                }
                else
                {                   
                    lbl_result.Visible = true;
                    lbl_result.ForeColor = Color.Red;
                    lbl_result.Text = "Não existe nenhum utilizador registado com esse email ou não se encontra ativo.";                     
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                myConn.Close();
            }


        }
    }
}