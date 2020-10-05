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
            mycommand.Parameters.AddWithValue("@roleId", Convert.ToInt32(ddl_profile.SelectedValue));
            mycommand.Parameters.AddWithValue("@phone", phonenumber.Value);
            mycommand.Parameters.AddWithValue("@datanasc", datanasc.Value);
            mycommand.Parameters.AddWithValue("@gender", ddl_gender.SelectedItem.Text);
            mycommand.Parameters.AddWithValue("@pw", Service.EncryptString(password.Value));
            mycommand.Parameters.AddWithValue("@email", email.Value);

            if (ddl_profile.SelectedItem.Text=="Reseller")
            {
                mycommand.Parameters.AddWithValue("@ativo",0);
            }
            else
            {

                mycommand.Parameters.AddWithValue("@ativo", 1);
            }

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
                    lbl_result.Visible = true;
                    lbl_result.ForeColor = Color.Green;
                    lbl_result.Text = "Utilizador adicionado com sucesso";
                    string htmltext = "O seu registo foi efetuado com sucesso. Caso se registou como revendedor aguarde pela confirmação da administração.";
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