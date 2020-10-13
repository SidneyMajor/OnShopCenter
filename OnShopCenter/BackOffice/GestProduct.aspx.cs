using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;


namespace OnShopCenter.BackOffice
{
    public partial class GestProduct : System.Web.UI.Page
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

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            Stream fileStream = FileUpload1.PostedFile.InputStream;

            int fileLength = FileUpload1.PostedFile.ContentLength; // a dimensão do ficheiro

            string fileContentType = FileUpload1.PostedFile.ContentType;// o content type do ficheiro

            string fileName = Guid.NewGuid().ToString();

            byte[] fileBinaryData = new byte[fileLength];

            int nb = fileStream.Read(fileBinaryData, 0, fileLength);

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "InsertProduct",

                Connection = myConn
            };

            mycommand.Parameters.AddWithValue("@productname", productname.Value);
            mycommand.Parameters.AddWithValue("@category", Convert.ToInt32(ddl_category.SelectedValue));
            mycommand.Parameters.AddWithValue("@price", price.Value);
            mycommand.Parameters.AddWithValue("@description", description.Value);
            mycommand.Parameters.AddWithValue("@quantity", quantity.Value);

            mycommand.Parameters.AddWithValue("@ficheiro", fileName);
            mycommand.Parameters.AddWithValue("@dados", fileBinaryData);
            mycommand.Parameters.AddWithValue("@contentType", fileContentType);
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
                    lbl_Erro.Text = "Produto inserido com sucesso.";
                }
                else
                {
                    lbl_Erro.Visible = true;
                    lbl_Erro.ForeColor = Color.Red;
                    lbl_Erro.Text = "Já existe um produto com esse Nome";
                }
            }
            catch (Exception ex)
            {
                lbl_Erro.Visible = true;
                lbl_Erro.ForeColor = Color.Red;
                lbl_Erro.Text = "Erro ao inserir o produto. " + ex.Message;
            }
            finally
            {
                myConn.Close();
            }

            Response.Redirect("GestProduct.aspx");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_productId")).Text = dr["productId"].ToString();
                ((TextBox)e.Item.FindControl("tproduct_nome")).Text = dr["productName"].ToString();
                ((TextBox)e.Item.FindControl("tcategory")).Text = dr["description1"].ToString();
                ((TextBox)e.Item.FindControl("tprice")).Text = dr["price"].ToString();
                ((TextBox)e.Item.FindControl("tdescription")).Text = dr["description"].ToString();
                ((TextBox)e.Item.FindControl("tquantity")).Text = dr["quantity"].ToString();

                ((Button)e.Item.FindControl("btn_save")).CommandArgument = dr["productId"].ToString();
                ((Button)e.Item.FindControl("btn_edit")).CommandArgument = dr["productId"].ToString();
                ((Button)e.Item.FindControl("btn_delete")).CommandArgument = dr["productId"].ToString();

            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string query = "update Product set ";
            string queryApaga = "delete from Product ";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);

            myConn.Open();

            if (e.CommandName.Equals("btn_save"))
            {
                query += "productName='" + ((TextBox)e.Item.FindControl("tproduct_nome")).Text + "', ";
                query += "price='" + ((TextBox)e.Item.FindControl("tprice")).Text + "', ";
                query += "description='" + ((TextBox)e.Item.FindControl("tdescription")).Text + "', ";
                query += "quantity='" + ((TextBox)e.Item.FindControl("tquantity")).Text + "' ";
                query += "WHERE productId=" + ((Button)e.Item.FindControl("btn_save")).CommandArgument;

                SqlCommand myCommand = new SqlCommand(query, myConn);
                myCommand.ExecuteNonQuery();
                myConn.Close();
                ((Button)e.Item.FindControl("btn_save")).Visible = false;
                ((Button)e.Item.FindControl("btn_edit")).Visible = true;
            }

            if (e.CommandName.Equals("btn_edit"))
            {
                ((TextBox)e.Item.FindControl("tproduct_nome")).ReadOnly = false;
                ((TextBox)e.Item.FindControl("tcategory")).ReadOnly = true;
                ((TextBox)e.Item.FindControl("tprice")).ReadOnly = false;
                ((TextBox)e.Item.FindControl("tdescription")).ReadOnly = false;
                ((TextBox)e.Item.FindControl("tquantity")).ReadOnly = false;
                ((Button)e.Item.FindControl("btn_save")).Visible = true;
                ((Button)e.Item.FindControl("btn_edit")).Visible = false;
            }

            if (e.CommandName.Equals("btn_delete"))
            {

                queryApaga += "WHERE productId=" + ((Button)e.Item.FindControl("btn_delete")).CommandArgument;

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
                query += "UPDATE Product SET ";
                query += "productName='" + ((TextBox)Repeater1.Items[i].FindControl("tproduct_nome")).Text + "', ";
                query += "price='" + ((TextBox)Repeater1.Items[i].FindControl("tprice")).Text + "', ";
                query += "description='" + ((TextBox)Repeater1.Items[i].FindControl("tdescription")).Text + "', ";
                query += "quantity='" + ((TextBox)Repeater1.Items[i].FindControl("tquantity")).Text + "' ";
                query += "WHERE productId=" + ((Label)Repeater1.Items[i].FindControl("lbl_productId")).Text + ";";

                ((Button)Repeater1.Items[i].FindControl("btn_save")).Visible = false;
                ((Button)Repeater1.Items[i].FindControl("btn_edit")).Visible = true;
            }

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myCommand.ExecuteNonQuery();
            myConn.Close();
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