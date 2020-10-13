<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnShopCenter.BackOffice.Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>On Shop Center</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/Config/assets/img/favicon.ico" />

    <link rel="icon" type="image/png" href="/Config/eCommerceDoc/images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/main_styles.css" />
    <link href="../Config/styles/sb-admin-2.min.css" rel="stylesheet" />
    <link href="../Config/styles/all.min.css" rel="stylesheet" />
    <link href="../Config/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <div class="header_overlay"></div>
                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                    <div class="logo">
                        <a href="Dashboard.aspx">
                            <div class="d-flex flex-row align-items-center justify-content-start">
                                <div>
                                    <img src="/Config/images/logo_1.png" alt="" />
                                </div>
                                <div>On Shop Center</div>
                            </div>
                        </a>
                    </div>

                    <div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
                        <!-- User -->
                        <div class="user">
                            <div>
                                <asp:Label ID="lbl_user" Text="" runat="server" CssClass="text-center text-dark" />
                                <div>
                                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-success" BorderStyle="Groove" UseSubmitBehavior="False" ValidateRequestMode="Disabled" OnClick="btn_login_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Content Row -->
            <div></div>
            <br />
            <br />
            <br />
            <br />

            <div class="container">
                <div class="row">
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xl font-weight-bold text-primary text-uppercase mb-1"><a href="GestProduct.aspx">Products</a> </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-desktop fa-2x  text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><a href="GestUser.aspx">Clients</a></div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                      <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><a href="GestCategory.aspx">Product Category</a></div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-plus fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.container-fluid -->
                <div class=" container row">
                    <div class="col-md-12">
                        <div class="card ">
                            <div class="card-footer align-content-center bg-warning">
                                <h3 class="text-center text-black-50">Order</h3>
                            </div>
                            <div class="card-body text-lg-center">
                                <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderId" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand" OnItemDataBound="ListView1_ItemDataBound">
                                    <AlternatingItemTemplate>
                                        <tr style="background-color: #FFFFFF; color: #284775;">

                                            <td>
                                                <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="orderDateLabel" runat="server" Text='<%# Eval("orderDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="deliveryDateLabel" runat="server" Text='<%# Eval("deliveryDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="fullNameLabel" runat="server" Text='<%# Eval("fullName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="roleNameLabel" runat="server" Text='<%# Eval("roleName") %>' />
                                            </td>
                                            <td>
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Delivery" CssClass="btn btn-primary w-50" />
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                            <tr>
                                                <td>No data was returned.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>

                                    <ItemTemplate>
                                        <tr style="background-color: #E0FFFF; color: #333333;">

                                            <td>
                                                <asp:Label ID="orderIdLabel" runat="server" Text='<%# Eval("orderId") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="orderDateLabel" runat="server" Text='<%# Eval("orderDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="deliveryDateLabel" runat="server" Text='<%# Eval("deliveryDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="fullNameLabel" runat="server" Text='<%# Eval("fullName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="roleNameLabel" runat="server" Text='<%# Eval("roleName") %>' />
                                            </td>
                                            <td>
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Delivery" CssClass="btn-primary" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server" class="table-responsive align-items-center">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                        <tr runat="server" style="background-color: #E0FFFF; color: #333333;">

                                                            <th runat="server">Order Id</th>
                                                            <th runat="server">Order Date</th>
                                                            <th runat="server">Delivery Date</th>
                                                            <th runat="server">Total</th>
                                                            <th runat="server">Customer</th>
                                                            <th runat="server">Role</th>
                                                            <th runat="server"></th>
                                                        </tr>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                                    <asp:DataPager ID="DataPager1" runat="server">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                            <asp:NumericPagerField />
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        </Fields>
                                                    </asp:DataPager>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>

                            <div class="card-footer">
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="325px" CssClass=" text-danger">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="orderDate" YValueMembers="Column1" ChartType="Bar"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="GetOrder" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE myOrder SET deliveryDate = GETDATE()"></asp:SqlDataSource>

                            </div>
                        </div>
                    </div>

                </div>


            </div>

        </div>
        <!-- End of Main Content -->




    </form>
</body>
</html>
