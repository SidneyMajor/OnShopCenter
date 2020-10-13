<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestUser.aspx.cs" Inherits="OnShopCenter.BackOffice.GestUser" %>

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
    <link rel="stylesheet" type="text/css" href="/Config/styles/bootstrap-4.1.2/bootstrap.min.css" />
    <link href="/Config/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/owl.theme.default.css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/animate.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/main_styles.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/responsive.css" />
    <link href="../Config/styles/bootstrap-4.1.2/bootstrap.min.css" rel="stylesheet" />
    <link href="../Config/eCommerceDoc/bootstrap-4.5.2-dist/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />

</head>
<body>
    <form id="form1" runat="server" class="login100-form validate-form p-b-33 p-t-5">
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
                                <a href="../Home/UserProfile.aspx"><asp:Label ID="lbl_user" Text="" runat="server" CssClass="text-center text-dark" /></a>
                                <div>
                                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-success" BorderStyle="Groove" UseSubmitBehavior="False" ValidateRequestMode="Disabled" OnClick="btn_login_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <div></div>
            <br />
            <br />
            <br />
            <br />



            <div class="row">
                <div class="card-body">
                    <div class="card-header bg-primary">
                        <h2 class="text-center text-white">Clients</h2>
                    </div>

                    <div class="col-12">
                        <asp:Repeater ID="RepeaterUsers" runat="server" OnItemCommand="RepeaterUsers_ItemCommand" OnItemDataBound="RepeaterUsers_ItemDataBound">
                            <HeaderTemplate>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title text-warning">All Customer</h3>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover table-responsive table-striped " id="MyTable">
                                            <thead>
                                                <tr>
                                                    <th>Full Name
                                                    </th>
                                                    <th>Tax Number
                                                    </th>
                                                    <th>Birth date
                                                    </th>
                                                    <th>Email
                                                    </th>
                                                    <th>Role
                                                    </th>
                                                    <th>IsActive?
                                                    </th>

                                                </tr>
                                            </thead>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%# Eval("FullName") %>
                                        </td>
                                        <td>
                                            <%# Eval("TaxNumber") %>
                                        </td>
                                        <td>
                                            <%# Eval("DateOfBirth").ToString() %>
                                        </td>
                                        <td>
                                            <%# Eval("Email") %>
                                        </td>
                                        <td>
                                            <%# Eval("RoleName") %>
                                        </td>
                                        <td>
                                            <%# Eval("IsActive") %>
                                        </td>
                                        <td>
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

                            </FooterTemplate>

                        </asp:Repeater>
                    </div>

                    <div class="col-12 mt-4">
                        <asp:HyperLink ID="hl_recuperar" runat="server" Visible="False">[hl_recuperar]</asp:HyperLink>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater1_ItemDataBound">
                            <HeaderTemplate>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title text-warning">Resellers Pending</h3>
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover table-responsive table-striped " id="MyTable">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Full Name
                                                    </th>
                                                    <th>Tax Number
                                                    </th>
                                                    <th>Birth date
                                                    </th>
                                                    <th>Email
                                                    </th>
                                                    <th>Role
                                                    </th>
                                                    <th>Active
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
                                            <asp:Label ID="lbl_userId" runat="server" Visible="false"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="fullname" ReadOnly="true"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="taxnumber" ReadOnly="true"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="dateofbirth" ReadOnly="true"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="email" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="role" ReadOnly="true"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="ative"></asp:CheckBox>
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="ListUserReseller" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script src="/Config/js/jquery-3.2.1.min.js"></script>
    <script src="../Config/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
    <script src="../Config/styles/bootstrap-4.1.2/popper.js"></script>
    <script src="/Config/plugins/greensock/TweenMax.min.js"></script>
    <script src="/Config/plugins/greensock/TimelineMax.min.js"></script>
    <script src="/Config/plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="/Config/plugins/greensock/animation.gsap.min.js"></script>
    <script src="/Config/plugins/greensock/ScrollToPlugin.min.js"></script>
    <script src="/Config/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="/Config/plugins/easing/easing.js"></script>
    <script src="/Config/plugins/progressbar/progressbar.min.js"></script>
    <script src="/Config/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="/Config/js/custom.js"></script>
    <script src="../Config/eCommerceDoc/vendor/bootstrap/js/popper.js"></script>
    <script src="../Config/plugins/progressbar/progressbar.min.js"></script>
    <script src="../Config/eCommerceDoc/bootstrap-4.5.2-dist/js/bootstrap.js"></script>
    <script src="../Config/eCommerceDoc/bootstrap-4.5.2-dist/js/bootstrap.bundle.js"></script>
    <script src="../Config/eCommerceDoc/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="../Config/eCommerceDoc/js/jquery-1.11.0.min.js"></script>

    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MyTable').DataTable();
        });
    </script>

</body>
</html>
