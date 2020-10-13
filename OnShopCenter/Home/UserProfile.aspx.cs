using OnShopCenter.Helper;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace OnShopCenter.Home
{
    public partial class UserProfile : System.Web.UI.Page
    {
        public User _user = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userlogin"] == null)
            {
                Response.Redirect("../Home/Login.aspx");
            }

            lbl_user.Text = $"Benvido {Session["userlogin"].ToString()}";
            btn_login.Text = "Logout";

            if (!IsPostBack)
            {
                if (Session["userId"] != null)
                {
                    var id = Convert.ToInt32(Session["userId"].ToString());
                    PopulateData(id);
                }
            }

        }

        private void PopulateData(int id)
        {
            string query = $"select * from myUser where userId ={id}";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand(query, myConn);

            myConn.Open();


            var reader = mycommand.ExecuteReader();

            while (reader.Read())
            {
                _user = new User
                {
                    UserId = reader.GetInt32(0),
                    FullName = reader.GetString(1),
                    Address = reader.GetString(2),
                    ZipCode = reader.GetString(3),
                    TaxNumber = reader.GetString(4),
                    DateOfBirth = reader.GetDateTime(9).ToString("yyyy-MM-dd"),
                    Email = reader.GetString(5),
                    PhoneNumber = reader.GetString(8),
                    Gender = reader.GetString(10),
                    RoleId = reader.GetInt32(7)
                };
            }

            fullname.Value = _user.FullName;
            dateofbirth.Value = _user.DateOfBirth;
            ddl_gender.Text = _user.Gender;
            ddl_role.SelectedValue = _user.RoleId.ToString();
            taxnumber.Value = _user.TaxNumber;
            email.Value = _user.Email;
            zipcode.Value = _user.ZipCode;
            address.Value = _user.Address;
            phonenumber.Value = _user.PhoneNumber;


            reader.Close();
            myConn.Close();

        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "EditUser",

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
            mycommand.Parameters.AddWithValue("@email", email.Value);


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
                    lbl_result.Text = "Utilizador editado com sucesso";
                }
                else
                {
                    lbl_result.Visible = true;
                    lbl_result.Text = "Utilizador não encontrado";
                }
            }
            catch (Exception ex)
            {
                lbl_result.Visible = true;
                lbl_result.ForeColor = Color.Red;
                lbl_result.Text = "Erro ao editar utilizador. " + ex.Message;
            }
            finally
            {
                myConn.Close();
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