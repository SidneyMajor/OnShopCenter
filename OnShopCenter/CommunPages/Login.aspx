<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnShopCenter.CommunPages.Login" %>

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
    <link rel="stylesheet" href="/Config/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/Config/assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="/Config/assets/css/flaticon.css" />
    <link rel="stylesheet" href="/Config/assets/css/slicknav.css" />
    <link rel="stylesheet" href="/Config/assets/css/animate.min.css" />
    <link rel="stylesheet" href="/Config/assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="/Config/assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="/Config/assets/css/themify-icons.css" />
    <link rel="stylesheet" href="/Config/assets/css/slick.css" />
    <link rel="stylesheet" href="/Config/assets/css/nice-select.css" />
    <link rel="stylesheet" href="/Config/assets/css/style.css" />

</head>
<body>
    <form id="form1" runat="server">


        <div class="card section text-lg-center ">
            <h5 class="card-header badge-pill text-black text-xl-center"><i class="fa fa-user-circle"></i> Login</h5>
            <div class="card-body  badge-info">
                <!--================login_part Area =================-->
                <section class="login_part  ">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6">
                                <div class="login_part_text text-center">
                                    <div class="login_part_text_iner">
                                        <h2>New to our Shop?</h2>
                                        <p>
                                            There are advances being made in science and technology
                                everyday, and a good example of this is the
                                        </p>
                                        <a href="#" class="btn_3">Create an Account</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="login_part_form">
                                    <div class="login_part_form_iner">
                                        <h3>Welcome Back !
                                    <br />
                                            Please Sign in now</h3>
                                        <div class="row contact_form">
                                            <div class="col-md-12 form-group p_star">
                                                <input type="text" class="form-control" id="name" name="name" value=""
                                                    placeholder="Username" />
                                            </div>
                                            <div class="col-md-12 form-group p_star">
                                                <input type="password" class="form-control" id="password" name="password" value=""
                                                    placeholder="Password" />
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <div class="creat_account d-flex align-items-center">
                                                    <input type="checkbox" id="f-option" name="selector"/>
                                                    <label for="f-option" class=" text-white">Remember me</label>
                                                </div>
                                                <button type="submit" value="submit" class="btn btn-primary btn-block">
                                                    log in
                                                </button>
                                                <a class="lost_pass text-white link" href="#">forget password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--================login_part end =================-->
            </div>
        </div>


        <footer>

            <!-- Footer bottom -->
            <div class="row">
                <div class="col-xl-7 col-lg-7 col-md-7">
                    <div class="footer-copy-right">
                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 col-md-5">
                    <div class="footer-copy-right f-right">
                        <!-- social -->
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer End-->
        </footer>

    </form>
    <!-- All JS Custom Plugins Link Here here -->
    <script src="/Config/assets/js/vendor/modernizr-3.5.0.min.js"></script>

    <!-- Jquery, Popper, Bootstrap -->
    <script src="/Config/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/Config/assets/js/popper.min.js"></script>
    <script src="/Config/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="/Config/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="/Config/assets/js/owl.carousel.min.js"></script>
    <script src="/Config/assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="/Config/assets/js/wow.min.js"></script>
    <script src="/Config/assets/js/animated.headline.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="/Config/assets/js/jquery.scrollUp.min.js"></script>
    <script src="/Config/assets/js/jquery.nice-select.min.js"></script>
    <script src="/Config/assets/js/jquery.sticky.js"></script>
    <script src="/Config/assets/js/jquery.magnific-popup.js"></script>



    <!-- Jquery Plugins, main Jquery -->
    <script src="/Config/assets/js/plugins.js"></script>
    <script src="/Config/assets/js/main.js"></script>

</body>
</html>
