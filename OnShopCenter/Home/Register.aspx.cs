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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signUp_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "InsertUser",

                Connection = myConn
            };
            
            mycommand.Parameters.AddWithValue("@fullname", fullname.Value);
            mycommand.Parameters.AddWithValue("@address", address.Value);
            mycommand.Parameters.AddWithValue("@zipcod", zipcode.Value);
            mycommand.Parameters.AddWithValue("@taxnumber", taxnumber.Value);
            mycommand.Parameters.AddWithValue("@roleId", Convert.ToInt32(ddl_role.SelectedValue));
            mycommand.Parameters.AddWithValue("@phone", phonenumber.Value);
            mycommand.Parameters.AddWithValue("@datanasc", dateofbirth.Value);
            mycommand.Parameters.AddWithValue("@gender", ddl_gender.SelectedItem.Text);
            mycommand.Parameters.AddWithValue("@pw", Service.EncryptString(password.Value));
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
            myConn.Open();
            try
            {

                mycommand.ExecuteNonQuery();
                int resposta = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);
                int resposta_num = Convert.ToInt32(mycommand.Parameters["@retorno_num"].Value);
                if (resposta == 1)
                {
                    lbl_result.Visible = true;
                    lbl_result.ForeColor = Color.Green;
                    lbl_result.Text = "Utilizador adicionado com sucesso";

                    string htmltext = string.Empty;

                    if (ddl_role.SelectedItem.Text=="Customer")
                    {
                        hl_recuperar.NavigateUrl = "https://localhost:44383/Home/ConfirmEmail.aspx?id=" + Service.EncryptString(resposta_num.ToString());

                        htmltext = "O seu registo foi efetuado com sucesso.\n " +
                           $"Para confimar a sua conta <a href=\"{hl_recuperar.NavigateUrl}\">Clique aqui</a>"; 
                    }
                    else
                    {
                        htmltext = "O seu registo foi efetuado com sucesso. Caso se registou como revendedor aguarde pela confirmação da administração.";
                    }
                   
                    Service.Send("Bemvindo ao On Shop Center",htmltext, email.Value);
                }
                else
                {
                    lbl_result.Visible = true;
                    lbl_result.Text = "Utilizador já existe";
                }
            }
            catch (Exception ex)
            {
                lbl_result.Visible = true;
                lbl_result.ForeColor = Color.Red;
                lbl_result.Text = "Erro ao inserir utilizador. " + ex.Message;
            }
            finally
            {
                myConn.Close();
            }
        }
    }
}