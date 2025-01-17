﻿using OnShopCenter.Helper;
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
            SqlParameter valor2 = new SqlParameter
            {
                ParameterName = "@retorno_id",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.Int,
                Size = 6
            };

            SqlParameter valor3 = new SqlParameter
            {
                ParameterName = "@retorno_role",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.VarChar,
                Size = 20
            };

            SqlParameter valor4 = new SqlParameter
            {
                ParameterName = "@retorno_username",
                Direction = ParameterDirection.Output,
                SqlDbType = SqlDbType.VarChar,
                Size = 50
            };

            //add parameter output
            mycommand.Parameters.Add(valor);
            mycommand.Parameters.Add(valor2);
            mycommand.Parameters.Add(valor3);
            mycommand.Parameters.Add(valor4);
            myConn.Open();
            try
            {
                mycommand.ExecuteNonQuery();
                int resposta = Convert.ToInt32(mycommand.Parameters["@retorno"].Value);

                if (resposta == 1)
                {
                    Session["userlogin"] = mycommand.Parameters["@retorno_username"].Value; ;
                    Session["userId"] = mycommand.Parameters["@retorno_id"].Value;
                    Session["userRole"] = mycommand.Parameters["@retorno_role"].Value;

                    if (Session["userRole"].ToString() == "Admin")
                    {
                        Response.Redirect("../BackOffice/Dashboard.aspx");
                    }

                    if (Session["anonimo"] != null)
                    {
                        List<OrderDetailsTemp> orderDetailsTemps = (List<OrderDetailsTemp>)Session["anonimo"];

                        PopulateCart(orderDetailsTemps);
                        Session["anonimo"] = null;
                    }
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

        private void PopulateCart(List<OrderDetailsTemp> orderDetailsTemps)
        {
            foreach (var item in orderDetailsTemps)
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
                SqlCommand mycommand = new SqlCommand
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "AddProduct",

                    Connection = myConn
                };

                //mycommand.Parameters.AddWithValue("@userId", 2);
                mycommand.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["userId"].ToString()));
                mycommand.Parameters.AddWithValue("@productId", item.ProductId);
                mycommand.Parameters.AddWithValue("@price", item.Price);
                mycommand.Parameters.AddWithValue("@quantity", item.Quantity);

                SqlParameter valor = new SqlParameter
                {
                    ParameterName = "@retorno",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Int,
                    Size = 6
                };
                //add parameter output
                mycommand.Parameters.Add(valor);

                try
                {
                    myConn.Open();
                    mycommand.ExecuteNonQuery();
                    // = mycommand.Parameters["@retorno"].Value.ToString();
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
}