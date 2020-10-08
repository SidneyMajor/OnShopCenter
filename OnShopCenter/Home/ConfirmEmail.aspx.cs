using OnShopCenter.Helper;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace OnShopCenter.Home
{
    public partial class ConfirmEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int num_util = 0;
            string resposta = "";
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
                CommandText = "ConfirmEmail",
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


            lbl_mensager.Text = resposta;
        }


    }
}