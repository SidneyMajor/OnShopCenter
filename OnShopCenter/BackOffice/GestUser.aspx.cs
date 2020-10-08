using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;

namespace OnShopCenter.BackOffice
{
    public partial class GestUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindigRepeaterUsers();
        }

        //protected void btn_Save_Click(object sender, EventArgs e)
        //{
        //    Stream fileStream = FileUpload1.PostedFile.InputStream;

        //    int fileLength = FileUpload1.PostedFile.ContentLength; // a dimensão do ficheiro

        //    string fileContentType = FileUpload1.PostedFile.ContentType;// o content type do ficheiro

        //    string fileName = Guid.NewGuid().ToString();

        //    byte[] fileBinaryData = new byte[fileLength];

        //    int n = fileStream.Read(fileBinaryData, 0, fileLength);

        //    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
        //    SqlCommand mycommand = new SqlCommand
        //    {
        //        CommandType = CommandType.StoredProcedure,
        //        CommandText = "InsertProduct",

        //        Connection = myConn
        //    };

        //    mycommand.Parameters.AddWithValue("@productname", productname.Value);
        //    mycommand.Parameters.AddWithValue("@category", Convert.ToInt32(ddl_category.SelectedValue));
        //    mycommand.Parameters.AddWithValue("@price", price.Value);
        //    mycommand.Parameters.AddWithValue("@description", description.Value);
        //    mycommand.Parameters.AddWithValue("@quantity", quantity.Value);

        //    mycommand.Parameters.AddWithValue("@ficheiro", fileName);
        //    mycommand.Parameters.AddWithValue("@dados", fileBinaryData);
        //    mycommand.Parameters.AddWithValue("@contentType", fileContentType);
        //    //Creat parameter output
        //    SqlParameter valor = new SqlParameter
        //    {
        //        ParameterName = "@retorno",
        //        Direction = ParameterDirection.Output,
        //        SqlDbType = SqlDbType.Int,
        //        Size = 1
        //    };
        //    //add parameter output
        //    mycommand.Parameters.Add(valor);
        //    myConn.Open();
        //    try
        //    {
        //        mycommand.ExecuteNonQuery();
        //        int resposta = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);

        //        if (resposta == 1)
        //        {
        //            lbl_Erro.Visible = true;
        //            lbl_Erro.ForeColor = Color.ForestGreen;
        //            lbl_Erro.Text = "Produto inserido com sucesso.";
        //        }
        //        else
        //        {
        //            lbl_Erro.Visible = true;
        //            lbl_Erro.ForeColor = Color.Red;
        //            lbl_Erro.Text = "Já existe um produto com esse Nome";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        lbl_Erro.Visible = true;
        //        lbl_Erro.ForeColor = Color.Red;
        //        lbl_Erro.Text = "Erro ao inserir o produto. " + ex.Message;
        //    }
        //    finally
        //    {
        //        myConn.Close();
        //    }
        //}

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_userId")).Text = dr["userId"].ToString();
                ((TextBox)e.Item.FindControl("fullname")).Text = dr["fullName"].ToString();
                ((TextBox)e.Item.FindControl("taxnumber")).Text = dr["taxNumber"].ToString();
                ((TextBox)e.Item.FindControl("dateofbirth")).Text = dr["datanasc"].ToString();
                ((TextBox)e.Item.FindControl("email")).Text = dr["email"].ToString();
                ((TextBox)e.Item.FindControl("role")).Text = dr["roleName"].ToString();
                ((CheckBox)e.Item.FindControl("ative")).Checked = Convert.ToBoolean(dr["ativo"]);

                //((Button)e.Item.FindControl("btn_save")).CommandArgument = dr["productId"].ToString();
                //((Button)e.Item.FindControl("btn_edit")).CommandArgument = dr["productId"].ToString();
                //((Button)e.Item.FindControl("btn_delete")).CommandArgument = dr["productId"].ToString();

            }
        }

        //protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    string query = "update Product set ";
        //    string queryApaga = "delete from Product ";

        //    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

        //    myConn.Open();

        //    if (e.CommandName.Equals("btn_save"))
        //    {
        //        query += "productName='" + ((TextBox)e.Item.FindControl("tproduct_nome")).Text + "', ";
        //        query += "price='" + ((TextBox)e.Item.FindControl("tprice")).Text + "', ";
        //        query += "description='" + ((TextBox)e.Item.FindControl("tdescription")).Text + "', ";
        //        query += "quantity='" + ((TextBox)e.Item.FindControl("tquantity")).Text + "' ";
        //        query += "WHERE productId=" + ((Button)e.Item.FindControl("btn_save")).CommandArgument;

        //        SqlCommand myCommand = new SqlCommand(query, myConn);
        //        myCommand.ExecuteNonQuery();
        //        myConn.Close();
        //        ((Button)e.Item.FindControl("btn_save")).Visible = false;
        //        ((Button)e.Item.FindControl("btn_edit")).Visible = true;
        //    }

        //    if (e.CommandName.Equals("btn_edit"))
        //    {
        //        ((TextBox)e.Item.FindControl("tproduct_nome")).ReadOnly = false;
        //        ((TextBox)e.Item.FindControl("tcategory")).ReadOnly = true;
        //        ((TextBox)e.Item.FindControl("tprice")).ReadOnly = false;
        //        ((TextBox)e.Item.FindControl("tdescription")).ReadOnly = false;
        //        ((TextBox)e.Item.FindControl("tquantity")).ReadOnly = false;
        //        ((Button)e.Item.FindControl("btn_save")).Visible = true;
        //        ((Button)e.Item.FindControl("btn_edit")).Visible = false;
        //    }

        //    if (e.CommandName.Equals("btn_delete"))
        //    {

        //        queryApaga += "WHERE productId=" + ((Button)e.Item.FindControl("btn_delete")).CommandArgument;

        //        SqlCommand myCommand = new SqlCommand(queryApaga, myConn);
        //        myCommand.ExecuteNonQuery();
        //        myConn.Close();
        //    }
        //}

        protected void btn_saveall_Click(object sender, EventArgs e)
        {
            string query = "";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            myConn.Open();

            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                query += "UPDATE myUser SET ";
                query += "ativo='" + ((CheckBox)Repeater1.Items[i].FindControl("ative")).Checked + "' ";
                query += "WHERE userId=" + ((Label)Repeater1.Items[i].FindControl("lbl_userId")).Text + ";";                


                hl_recuperar.NavigateUrl = "https://localhost:44383/Home/HomePage.aspx";

                string htmltext = $"Caro cliente <b>{((TextBox)Repeater1.Items[i].FindControl("fullname")).Text}</b> a sua conta esta confirmada como revendedor." +
                   $"Coemeçe a sua compara <a href=\"{hl_recuperar.NavigateUrl}\">Clique aqui</a>";


                Service.Send("Confimação de Conta", htmltext, ((TextBox)Repeater1.Items[i].FindControl("email")).Text);

            }

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
        }


        private void BindigRepeaterUsers()
        {
            /*string query = " select Product.productId, Product.productName,Product.price, Product.description,Product.quantity," +
                "Category.description from Product inner join Category on Category.categoryId = Product.categoryId " +
                "order by Product.productName";*/
            List<User> users = new List<User>();

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "ListUserCustumer",

                Connection = myConn
            };

            myConn.Open();


            var reader = mycommand.ExecuteReader();

            while (reader.Read())
            {
                users.Add(new User
                {
                    UserId = reader.GetInt32(0),
                    FullName = reader.GetString(1),
                    TaxNumber = reader.GetString(2),
                    DateOfBirth = reader.GetDateTime(3).ToShortDateString(),
                    Email = reader.GetString(4),
                    IsActive = reader.GetBoolean(5),
                    RoleName = reader.GetString(6)
                });
            }

            reader.Close();
            myConn.Close();


            RepeaterUsers.DataSource = users;
            RepeaterUsers.DataBind();
        }



        protected void RepeaterUsers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                User dr = (User)e.Item.DataItem;

                ((Button)e.Item.FindControl("btn_edit")).CommandArgument = dr.UserId.ToString();
                ((Button)e.Item.FindControl("btn_delete")).CommandArgument = dr.UserId.ToString();

            }
        }



        protected void RepeaterUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string queryApaga = "delete from myUser";
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            if (e.CommandName.Equals("btn_edit"))
            {
                Session["userId"] = ((Button)e.Item.FindControl("btn_edit")).CommandArgument;
                Response.Redirect("EditUser.aspx");
            }

            if (e.CommandName.Equals("btn_delete"))
            {
                try
                {

                    queryApaga += "WHERE userId=" + ((Button)e.Item.FindControl("btn_delete")).CommandArgument;

                    SqlCommand myCommand = new SqlCommand(queryApaga, myConn);
                    myCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write("Error to delete user. " + ex.Message);
                }
                finally
                {
                    myConn.Close();
                }
            }
        }
    }
}