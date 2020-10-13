<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnShopCenter.Home.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>On Shop Center</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/Config/assets/img/favicon.ico" />

    <!-- CSS here -->
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/Config/eCommerceDoc/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/bootstrap/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/fonts/iconic/css/material-design-iconic-font.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/css-hamburgers/hamburgers.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/animsition/css/animsition.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/vendor/daterangepicker/daterangepicker.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/css/util.css" />
    <link rel="stylesheet" type="text/css" href="/Config/eCommerceDoc/css/main.css" />
    <!--===============================================================================================-->
    <link href="../Config/eCommerceDoc/bootstrap-4.5.2-dist/css/bootstrap.css" rel="stylesheet" />
</head>
<body style="background-image: url('/Config/eCommerceDoc/images/bg-01.jpg'); background-size: cover; background-repeat: no-repeat; padding: 15px;">
    <form id="form1" runat="server" class="validate-form ">
        <div class="container">
            <div class="row ml-5">
                <div class="col-12 ">
                    <span class="login100-form-title p-b-20 mt-5"><i class="fa fa-home mr-1"></i> On Shop Center </span>

                    <div>
                        <asp:Label ID="lbl_result" runat="server" Text="" CssClass="text-center alert-success btn-block" Font-Size="X-Large" Visible="false"></asp:Label><br />
                    </div>

                    <div class="m-3 p-5 bg-white" style="border-radius: 10px;">
                         <span class="login100-form-title p-b-20 mb-1 text-black-50">Sign Up </span>
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
                                        <span class="input-group-text" id="basic-addon6"><i class="fa fa-phone"></i></span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="999-999-999" aria-label="Phone" aria-describedby="basic-addon6" runat="server" id="phonenumber" aria-required="False" maxlength="15" />
                                </div>
                            </div>
                            <div class="col-md-6">

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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="SELECT * FROM [UserRole] WHERE ([roleName] NOT LIKE '%' + @roleName + '%')">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Admin" Name="roleName" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon5"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                                    </div>
                                    <input type="email" class="form-control" placeholder="email@email.com" aria-label="Email" aria-describedby="basic-addon5" runat="server" id="email" required="required" />
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon10"><i class="fa fa-lock"></i></span>
                                    </div>
                                    <input id="password" runat="server" aria-describedby="basic-addon10" aria-label="Password" placeholder="Password" class="form-control" type="password" required="required" />
                                </div>
                            </div>

                            <div class="col-md-6">

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon11"><i class="fa fa-lock"></i></span>
                                    </div>
                                    <input id="confirmpassword" runat="server" aria-describedby="basic-addon11" aria-label="Confirm Password" placeholder="Confirm Password" class="form-control" type="password" required="required" />
                                </div>
                            </div>

                        </div>


                        <div class="m-t-2 text-center btn-block">
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" ErrorMessage="Password does not match!" ForeColor="Red" Type="Integer" SetFocusOnError="True" CssClass="alert-danger btn-block"></asp:CompareValidator>
                        </div>


                        <div class="container-login100-form-btn m-t-10">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <asp:Button ID="btn_signUp" runat="server" Text="Sign up" CssClass="login100-form-btn" OnClick="btn_signUp_Click"></asp:Button>

                            </div>

                            <a href="Login.aspx" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">Sign in
							        <i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
                            <asp:HyperLink ID="hl_recuperar" runat="server" Visible="False">[hl_recuperar]</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </form>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/bootstrap/js/popper.js"></script>
    <script src="../Config/eCommerceDoc/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../Config/eCommerceDoc/vendor/bootstrap/js/bootstrap.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/daterangepicker/moment.min.js"></script>
    <script src="../Config/eCommerceDoc/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="../Config/eCommerceDoc/js/main.js"></script>
    <script src="../Config/eCommerceDoc/js/jquery-1.11.0.min.js"></script>
    <script src="../Config/eCommerceDoc/bootstrap-4.5.2-dist/js/bootstrap.js"></script>
</body>
</html>
