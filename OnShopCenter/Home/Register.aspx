<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnShopCenter.Home.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>On Shop Center</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="manifest" href="site.webmanifest" />
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
                <div class="col-10 ">
                    <div class="login100-form validate-form">
                        <span class="login100-form-title p-b-20 mt-5">Sign Up </span>

                        <div class="alert-success btn-block">
                            <asp:Label ID="lbl_result" runat="server" Text=""  CssClass="text-center" Font-Size="X-Large"></asp:Label><br />
                        </div>

                        <div class="m-5 p-5 bg-white" style="border-radius: 10px;">


                            <div class="row">

                                <div class="col-md-6 mt-1">
                                    <div class="wrap-input100 validate-input" data-validate="Name is required">
                                        <input class="input101" type="text" name="name" placeholder="Full name" id="fullname" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input">
                                        <span class="label-input100">Gender</span>
                                        <asp:DropDownList ID="ddl_gender" runat="server" CssClass="dropdown-item">
                                            <asp:ListItem>M</asp:ListItem>
                                            <asp:ListItem>F</asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Address is required">
                                        <input class="input101" type="text" name="address" placeholder="Address" id="address" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Zip Code is required">
                                        <input class="input101" type="text" name="zipcodes" placeholder="0000-000" id="zipcode" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Tax Number is required">
                                        <input class="input101" type="text" name="taxnumber" placeholder="Tax Number" id="taxnumber" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input">
                                        <input class="input101" type="text" name="phonenumber" placeholder="Phone Number" id="phonenumber" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Date of Birth is required">
                                        <span class="label-input100">Date of Birth</span>
                                        <input class="input101 start-date" type="date" name="datanasc" id="datanasc" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <div class="wrap-input100 validate-input" data-validate="Type of profile is required">
                                        <span class="label-input100">Type of profile</span>
                                        <asp:DropDownList ID="ddl_profile" runat="server" CssClass="dropdown-item" DataSourceID="SqlDataSource1" DataTextField="roleName" DataValueField="roleId"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="SELECT * FROM [UserRole] WHERE ([roleName] NOT LIKE '%' + @roleName + '%')">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Admin" Name="roleName" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                                        <input class="input101" type="email" name="email" placeholder="Email: ex@abc.xyz" id="email" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                                        <input class="input101" type="password" name="pass" placeholder="Password" id="password" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="wrap-input100 validate-input" data-validate="Repeat Password is required">
                                        <input class="input101" type="password" name="repeat-pass" placeholder="Repeat Password" id="repeat_password" runat="server" />
                                        <span class="focus-input100"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="m-t-2">
                                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="repeat_password" ErrorMessage="Password does not match!" ForeColor="Red" Type="Integer" SetFocusOnError="True"></asp:CompareValidator>
                            </div>


                            <div class="container-login100-form-btn m-t-32">
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
