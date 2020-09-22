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
</head>
<body>
    <form id="form1" runat="server" class="login100-form validate-form p-b-33 p-t-5">
       <div class="limiter">
            <div class="container-login100" style="background-image: url('/Config/eCommerceDoc/images/bg-01.jpg');">
                <div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
                    <div class="login100-form validate-form">
                        <span class="login100-form-title p-b-20">Sign Up
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="Name is required">
                            <span class="label-input100">Full Name</span>
                            <input class="input101" type="text" name="name" placeholder="Name..." id="name" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Address is required">
                            <span class="label-input100">Address</span>
                            <input class="input101" type="text" name="address" placeholder="Address" id="address" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Tax Number is required">
                            <span class="label-input100">Tax Number</span>
                            <input class="input101" type="text" name="taxnumber" placeholder="Tax Number" id="taxnumber" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                            <span class="label-input100">Email</span>
                            <input class="input101" type="text" name="email" placeholder="Email addess..." id="email" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Username is required">
                            <span class="label-input100">Username</span>
                            <input class="input101" type="text" name="username" placeholder="Username..." id="username" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                       
                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input101" type="password" name="pass" placeholder="*************" id="password" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Repeat Password is required">
                            <span class="label-input100">Repeat Password</span>
                            <input class="input101" type="password" name="repeat-pass" placeholder="*************" id="repeat_password" runat="server" />
                            <span class="focus-input100"></span>
                        </div>

                        <div class="m-t-2">
                            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="repeat_password" ErrorMessage="Password does not match!" ForeColor="Red" Type="Integer" SetFocusOnError="True"></asp:CompareValidator>
                        </div>
                        <div>
                            <asp:Label ID="lbl_result" runat="server" Text="" Font-Size="Small"></asp:Label><br />
                        </div>

                        <div class="container-login100-form-btn m-t-32">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <asp:Button ID="btn_signUp" runat="server" Text="Sign up" class="login100-form-btn" OnClick="btn_signUp_Click"></asp:Button>

                            </div>

                            <a href="Login.aspx" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">Sign in
							<i class="fa fa-long-arrow-right m-l-5"></i>
                            </a>
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
</body>
</html>
