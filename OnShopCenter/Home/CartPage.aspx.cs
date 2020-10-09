﻿using OnShopCenter.Helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI.WebControls;


namespace OnShopCenter.Home
{
    public partial class CartPage : System.Web.UI.Page
    {
        public List<OrderDetailsTemp> OrderDetailsTemps { get; set; } = new List<OrderDetailsTemp>();
        
        public int ProductNumber { get; set; } = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userlogin"] == null)
            //{
            //    Response.Redirect("../Home/Login.aspx");
            //}
            //else
            //{
            //    var id = Convert.ToInt32(Session["userId"].ToString());
            //    BindingRepeaterOrder(id);
            //}

            BindingRepeaterOrder(1);
        }

       
        public  void BindingRepeaterOrder(int id)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "GetOrderDetails",

                Connection = myConn
            };

            

            mycommand.Parameters.AddWithValue("@userId", id);
            myConn.Open();


            var reader = mycommand.ExecuteReader();
            //numItemInCart.Text = mycommand.Parameters["@retorno"].Value.ToString();
           
            while (reader.Read())
            {
                numItemInCart.Text = reader.GetInt32(7).ToString();
                lbl_total.Text = reader.GetSqlMoney(8).ToString();
                lbl_sub.Text= reader.GetSqlMoney(8).ToString();
                OrderDetailsTemps.Add(new OrderDetailsTemp
                {
                    ProductId = reader.GetInt32(0),
                    ProductName = reader.GetString(1),
                    Price = reader.GetSqlMoney(2),
                    Description = reader.GetString(3),
                    Category = reader.GetString(4),
                    Quantity = reader.GetInt32(5),
                    UserId=reader.GetInt32(6),                   
                });

               
            }
            
            reader.Close();
            myConn.Close();

            
            RepeaterOrder.DataSource = OrderDetailsTemps;
            RepeaterOrder.DataBind();
        }

        protected void btn_clearCart_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnShopCenterConnectionString"].ConnectionString);
            SqlCommand mycommand = new SqlCommand
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "ClearCart",

                Connection = myConn
            };


            //int id = Convert.ToInt32(Session["userId"].ToString());
            mycommand.Parameters.AddWithValue("@userId", 1);
            myConn.Open();

            try
            {
                mycommand.ExecuteNonQuery();
                myConn.Close();
            }
            catch (Exception)
            {

                throw;
            }

            Response.Redirect("CartPage.aspx");
        }
    }
}