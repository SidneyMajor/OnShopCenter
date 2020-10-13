<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnShopCenter.Home.Login" %>

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

</head>
<body>
    <form id="form1" runat="server" class="login100-form validate-form p-b-33 p-t-5">


        <div class="limiter">
            <div class="container-login100" style="background-image: url('/Config/eCommerceDoc/images/bg-01.jpg');">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
                    <div class="login100-form validate-form">
                        <span class="login100-form-title p-b-49">Login
                        </span>
                        <div class="wrap-input100 validate-input m-b-23" data-validate="Username is reauired">
                            <span class="label-input100">Username</span>
                            <input class="input100" type="text" name="username" placeholder="Type your email" id="username" runat="server" />
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Password is required">
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="pass" placeholder="Type your password" id="password" runat="server" />
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>

                        <div class="text-right p-t-8 p-b-31">
                            <a href="RecoverPassword.aspx">Forgot password?
                            </a>
                        </div>

                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="login100-form-btn" OnClick="btn_login_Click" />
                            </div>
                        </div>
                        <div class="mt-2">
                            <asp:Label ID="lbl_Erro" runat="server" CssClass="alert-danger label-input100 text-center btn-block" ForeColor="Red" Font-Size="X-Large" Visible="false"></asp:Label>
                        </div>
                        <div class="flex-col-c p-t-50">
                            <span class="txt1 p-b-17">Or Sign Up Using
                            </span>

                            <a href="Register.aspx" class="txt2">Sign Up
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

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
    </form>


</body>
</html>
