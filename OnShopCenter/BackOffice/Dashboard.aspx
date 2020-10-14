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
    <link rel="shortcut icon" type="image/x-icon" href="../Config/assets/img/favicon.ico" />

    <link rel="icon" type="image/png" href="/Config/eCommerceDoc/images/icons/favicon.ico" />
    <link href="../Config/assets/css/fontawesome-all.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/main_styles.css" />
    <link href="../Config/styles/sb-admin-2.min.css" rel="stylesheet" />
    <link href="../Config/styles/all.min.css" rel="stylesheet" />
    <%--<link href="../Config/eCommerceDoc/bootstrap-4.5.2-dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../Config/eCommerceDoc/css/util.css" rel="stylesheet" />
    <%--<link href="../Config/styles/bootstrap-4.1.2/bootstrap.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
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
                                <a href="../Home/UserProfile.aspx">
                                    <asp:Label ID="lbl_user" Text="" runat="server" CssClass="text-center text-dark" /></a>
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
                                    <i class="fa fa-desktop fa-2x  text-gray-300"></i>
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
                                    <i class="fa fa-users fa-2x text-gray-300"></i>
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
                                    <i class="fa fa-plus fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- accordion -->

            <div id="accordion">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-footer p-2 badge-primary" id="headingOne">
                            <h5>
                                <button class="btn btn-block text-white" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    User Role
                                </button>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="mt-2">
                                            <asp:Label ID="lbl_Erro" runat="server" CssClass="label-input100 text-center" Font-Size="X-Large"></asp:Label>
                                        </div>
                                        <button class="btn btn-primary mb-2" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            Insert Role
                                        </button>
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="collapse validate-form" id="collapseExample">
                                                    <div class="card card-body">

                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" id="basic-addon1"></span>
                                                            </div>
                                                            <input type="text" class="form-control" placeholder="Description" aria-label="Description" aria-describedby="basic-addon1" runat="server" id="description" required="required" />
                                                        </div>

                                                        <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btn_Save_Click" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-7">
                                        <div class="card badge-secondary">
                                            <div class="card-body badge-info">

                                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                                    <HeaderTemplate>
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                <h3 class="panel-title">User Role</h3>
                                                            </div>
                                                            <div class="panel-body">
                                                                <table class="table table-hover table-responsive table-striped " id="MyTable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Id
                                                                            </th>
                                                                            <th>Description
                                                                            </th>
                                                                            <th>
                                                                                <asp:Button ID="btn_saveall" runat="server" Text="Save All" CssClass="btn btn-sm btn-primary" OnClick="btn_saveall_Click" UseSubmitBehavior="false" />
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                    </HeaderTemplate>

                                                    <ItemTemplate>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <b>
                                                                        <asp:Label ID="lbl_roleId" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox runat="server" ID="description" ReadOnly="true"> </asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="btn btn-sm btn-success" CommandName="btn_save" UseSubmitBehavior="false" Visible="false" />

                                                                    <asp:Button ID="btn_edit" runat="server" Text="Edit" CssClass="btn btn-sm btn-warning" CommandName="btn_edit" UseSubmitBehavior="false" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="btn_delete" UseSubmitBehavior="false" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </ItemTemplate>

                                                    <FooterTemplate>
                                                        </table>
                         
                               </div>
                            </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="SELECT * FROM [UserRole]"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-footer p-2 badge-warning" id="headingTwo">
                            <h5>
                                <button class="btn btn-block collapsed text-white" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Order
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">

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
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Delivery" CssClass="btn btn-primary" />
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
                                        <tr style="background-color: #E0FFFF; color: #333333;" class="m-5">

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
                                        <div class="container ml-5">
                                            <table runat="server" class="table-responsive align-items-center m-4">
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
                                                            <tr id="itemPlaceholder" runat="server" class="mr-4">
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
                                        </div>

                                    </LayoutTemplate>
                                </asp:ListView>
                            </div>

                            <div>
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
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>
