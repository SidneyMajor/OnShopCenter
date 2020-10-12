<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="OnShopCenter.BackOffice.EditUser" %>

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
</head>
<body>
    <form id="form1" runat="server">

        <div class="super_container mt-xl-5">

            <!-- Header -->

            <header class="header">
                <div class="header_overlay"></div>
                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                    <div class="logo">
                        <a href="#">
                            <div class="d-flex flex-row align-items-center justify-content-start">
                                <div>
                                    <img src="/Config/images/logo_1.png" alt="" />
                                </div>
                                <div>On Shop Center</div>
                            </div>
                        </a>
                    </div>
                    <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                    <div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
                        <!-- User -->
                        <div class="user">
                            <div>
                                <asp:Label ID="lbl_user" Text="" runat="server" />
                                <div>
                                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-success" BorderStyle="Groove" UseSubmitBehavior="False" ValidateRequestMode="Disabled" OnClick="btn_login_Click" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </header>
            <div class="container mt-5">
                <div class="card badge-info">
                    <div class=" card-header ">
                        <a href="GestUser.aspx" id="link" runat="server" class="btn btn-secondary mb-2"><i class="fa fa-arrow-circle-o-left mr-1"></i>Back</a>
                        <h2 class="text-white font-weight-bold btn-block border-dark"><i class="fa fa-user-circle text-white-50 mr-1"></i>User Information</h2>
                        <div class="card card-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-user-circle"></i></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Full Name" aria-label="Full Name" aria-describedby="basic-addon1" runat="server" id="fullname" required="required" />
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon9"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                                        </div>
                                        <asp:DropDownList ID="ddl_gender" runat="server" CssClass="form-control" aria-label="Gender" aria-describedby="basic-addon9" required="required">
                                            <asp:ListItem>M</asp:ListItem>
                                            <asp:ListItem>F</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2"><i class="fa fa-address-book"></i></span>
                                        </div>
                                        <input type="text" aria-multiline="true" class="form-control" placeholder="Address" aria-label="Address" aria-describedby="basic-addon2" runat="server" id="address" required="required" />
                                    </div>
                                </div>
                                <div class="col-md-3">

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon3"><i class="fa fa-location-arrow"></i></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="0000-000" aria-label="Zip Code" aria-describedby="basic-addon3" runat="server" id="zipcode" required="required" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon4">#</span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Tax Number" aria-label="Tax Number" maxlength="20" aria-describedby="basic-addon4" runat="server" id="taxnumber" required="required" min="9" />
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon5"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                                        </div>
                                        <input type="email" class="form-control" placeholder="email@email.com" aria-label="Email" aria-describedby="basic-addon5" runat="server" id="email" required="required" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon6"><i class="fa fa-phone"></i></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="999-999-999" aria-label="Phone" aria-describedby="basic-addon6" runat="server" id="phonenumber" aria-required="False" maxlength="15" />
                                    </div>
                                </div>
                                <div class="col-md-3">

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon7"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <input id="dateofbirth" runat="server" aria-describedby="basic-addon7" aria-label="Date Of Birth" class="form-control" type="date" value="yyyy-MM-dd" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon8">Role</span>
                                        </div>
                                        <asp:DropDownList ID="ddl_role" runat="server" CssClass="form-control" aria-label="Role" aria-describedby="basic-addon8" required="required" DataSourceID="SqlDataSource1" DataTextField="roleName" DataValueField="roleId"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="SELECT * FROM [UserRole]"></asp:SqlDataSource>
                                    </div>

                                </div>

                            </div>
                            <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                            <div class="alert-success btn-block">
                                <asp:Label ID="lbl_result" runat="server" Text="" CssClass="text-center" Font-Size="X-Large"></asp:Label><br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
