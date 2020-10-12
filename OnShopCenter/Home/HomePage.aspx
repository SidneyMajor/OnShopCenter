<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnShopCenter.Home.HomePage" %>

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
    <%--<link href="../Config/styles/product.css" rel="stylesheet" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="super_container">
            <!-- Header -->
            <header class="header">
                <div class="header_overlay"></div>
                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                    <div class="logo">
                        <a href="HomePage.aspx">
                            <div class="d-flex flex-row align-items-center justify-content-start">
                                <div>
                                    <img src="/Config/images/logo_1.png" alt="" />
                                </div>
                                <div>On Shop Center</div>
                            </div>
                        </a>
                    </div>
                    <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                    <%-- <nav class="main_nav">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li class="active"><a href="#">Women</a></li>
                            <li><a href="#">Men</a></li>
                            <li><a href="#">Kids</a></li>
                            <li><a href="#">Home Deco</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>--%>
                    <div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
                        <!-- Search -->
                        <%--  <div class="header_search">
                            <div id="header_search_form">
                                <input type="text" class="search_input" placeholder="Search Item" required="required" />
                                <button class="header_search_button">
                                    <img src="/Config/images/search.png" alt="" /></button>
                            </div>
                        </div>--%>
                        <!-- User -->
                        <div class="user">
                            <a href="/CommunPages/Login.aspx">
                                <div>
                                    <img src="/Config/images/user.svg" alt="https://www.flaticon.com/authors/freepik" /><div>1</div>
                                </div>
                            </a>
                        </div>
                        <!-- Cart -->
                        <div class="cart  user">
                            <a href="CartPage.aspx">
                                <div>
                                    <img class="svg" src="/Config/images/cart.svg" alt="https://www.flaticon.com/authors/freepik" /><div>
                                        <asp:Label ID="numItemInCart" Text="0" runat="server"></asp:Label></div>
                                </div>
                            </a>
                        </div>
                        <!-- Phone -->
                        <div class="header_phone d-flex flex-row align-items-center justify-content-start">
                            <div>
                                <div>
                                    <img src="/Config/images/phone.svg" alt="https://www.flaticon.com/authors/freepik" />
                                </div>
                            </div>
                            <div>+1 912-252-7350</div>
                        </div>
                    </div>
                </div>
            </header>

            <div class="super_container_inner">
                <div class="super_overlay"></div>
                <!-- Products -->

                <div class="products">
                    <div class="container">
                        <div class="row products_row">
                            <asp:Repeater ID="RepeaterProducts" runat="server" OnItemCommand="RepeaterProducts_ItemCommand" OnItemDataBound="RepeaterProducts_ItemDataBound">
                                <ItemTemplate>

                                    <!-- Product -->
                                    <div class="col-xl-4 col-md-6 ">
                                        <div class="product">
                                            <div class="product_image">
                                                <div class="card-footer ">
                                                    <img src="<%# Eval("ImagePath") %>" style="background-position:center; background-size:cover; height:300px; width:350px;" alt="" />
                                                    <%--<asp:Image ID="Image1" runat="server" ImageUrl="<%# Eval("Image") %>" />--%>
                                                </div>
                                            </div>
                                            <div class="product_content">
                                                <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                    <div>
                                                        <div>
                                                            <div class="product_name"><a href="#"><%# Eval("ProductName") %></a></div>
                                                            <div class="product_category"><%# Eval("Description") %></div>
                                                        </div>
                                                    </div>
                                                    <div class="ml-auto text-right">
                                                        <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                        <div class="product_price text-right">€<span><%# Eval("Price") %></span></div>
                                                    </div>
                                                </div>
                                                <div class="product_buttons">
                                                    <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                        <div class="text-right d-flex flex-column align-items-center justify-content-center">
                                                            <div>
                                                                <div class="text-capitalize text-dark"><%# Eval("Category") %></div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="card-footer product_button">
                                                            <div>
                                                                <div>
                                                                    <asp:Button ID="btn_cart" runat="server" CssClass="btn btn-success btn-block w-100 border-0 text-dark" UseSubmitBehavior="false" CommandName="btn_cart" Text="Add" BackColor="Transparent"/><div>+</div>
                                                                    <%--<img src="/Config/images/cart.svg" class="svg" alt="" id="cart"  runat="server" /><%--<div>+</div>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- Features -->

                <div class="features">
                    <div class="container">
                        <div class="row">

                            <!-- Feature -->
                            <div class="col-lg-4 feature_col">
                                <div class="feature d-flex flex-row align-items-start justify-content-start">
                                    <div class="feature_left">
                                        <div class="feature_icon">
                                            <img src="/Config/images/icon_1.svg" alt="" />
                                        </div>
                                    </div>
                                    <div class="feature_right d-flex flex-column align-items-start justify-content-center">
                                        <div class="feature_title">Fast Secure Payments</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Feature -->
                            <div class="col-lg-4 feature_col">
                                <div class="feature d-flex flex-row align-items-start justify-content-start">
                                    <div class="feature_left">
                                        <div class="feature_icon ml-auto mr-auto">
                                            <img src="/Config/images/icon_2.svg" alt="" />
                                        </div>
                                    </div>
                                    <div class="feature_right d-flex flex-column align-items-start justify-content-center">
                                        <div class="feature_title">Premium Products</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Feature -->
                            <div class="col-lg-4 feature_col">
                                <div class="feature d-flex flex-row align-items-start justify-content-start">
                                    <div class="feature_left">
                                        <div class="feature_icon">
                                            <img src="/Config/images/icon_3.svg" alt="" />
                                        </div>
                                    </div>
                                    <div class="feature_right d-flex flex-column align-items-start justify-content-center">
                                        <div class="feature_title">Free Delivery</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer -->

                <footer class="footer">
                    <div class="footer_content">
                        <div class="container">
                            <div class="row">

                                <!-- About -->
                                <div class="col-lg-4 footer_col">
                                    <div class="footer_about">
                                        <div class="footer_logo">
                                            <a href="#">
                                                <div class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="footer_logo_icon">
                                                        <img src="/Config/images/logo_2.png" alt="" />
                                                    </div>
                                                    <div>On Shop Center</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="footer_about_text">
                                            <p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Fusce venenatis vel velit vel euismod.</p>
                                        </div>
                                    </div>
                                </div>



                                <!-- Footer Contact -->
                                <div class="col-lg-4 footer_col">
                                    <div class="footer_contact">
                                        <div class="footer_social">
                                            <div class="footer_title">Social</div>
                                            <ul class="footer_social_list d-flex flex-row align-items-start justify-content-start">
                                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="footer_bar">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="footer_bar_content d-flex flex-md-row flex-column align-items-center justify-content-start">
                                        <div class="copyright order-md-1 order-2">
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                            All rights reserved <i class="fa fa-heart-o" aria-hidden="true"></i>by <a href="#" target="_blank">Sidney Major</a>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
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
</body>
</html>
