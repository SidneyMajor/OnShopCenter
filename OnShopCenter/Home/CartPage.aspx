﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="OnShopCenter.Home.CartPage" %>

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
    <link rel="stylesheet" type="text/css" href="/Config/styles/bootstrap-4.1.2/bootstrap.min.css" />
    <link href="/Config/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/cart.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/cart_responsive.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/main_styles.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/responsive.css" />
    <link href="../Config/styles/bootstrap-4.1.2/bootstrap.min.css" rel="stylesheet" />
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
                            <div>+351 912-252-750</div>
                        </div>
                    </div>
                </div>
            </header>

            <div class="super_container_inner">
                <div class="super_overlay"></div>

                <div class="mt-10 badge-dark">
                    <div class="home_container d-flex flex-column align-items-center justify-content-end">
                        <div class="text-center">
                            <div class="home_title mb-4">Shopping Cart</div>
                            <asp:Label ID="resellerInfo" runat="server" CssClass="text-center text-white-50" Text="Preço válido online para revendedores com 20% de descontos incluído." Visible="false"/>
                        </div>
                    </div>
                </div>
                <!-- Cart -->

                <div class="cart_section">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="cart_container">
                                    <asp:Repeater ID="RepeaterOrder" runat="server" OnItemCommand="RepeaterOrder_ItemCommand" OnItemDataBound="RepeaterOrder_ItemDataBound">
                                        <HeaderTemplate>
                                            <!-- Cart Bar -->
                                            <div class="cart_bar">
                                                <ul class="cart_bar_list item_list d-flex flex-row align-items-center justify-content-end">
                                                    <li class="mr-auto">Product</li>
                                                    <li>Category</li>
                                                    <li>Price</li>
                                                    <li>Quantity</li>
                                                    <li>Total</li>
                                                </ul>
                                            </div>
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <!-- Cart Items -->
                                            <div class="cart_items">
                                                <ul class="cart_items_list">

                                                    <!-- Cart Item -->
                                                    <li class="cart_item item_list d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-end justify-content-start">
                                                        <div class="product d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start mr-auto">
                                                            <div>
                                                                <div class="product_number">#<%# (ProductNumber+=1).ToString()%></div>
                                                            </div>
                                                            <div>
                                                                <div class="product_image">
                                                                    <img src="<%# Eval("ImagePath") %>" alt="" />
                                                                </div>
                                                            </div>
                                                            <div class="product_name_container">
                                                                <div class="product_name"><%# Eval("ProductName") %></div>
                                                                <div class="product_text"><%# Eval("Description") %></div>
                                                            </div>
                                                        </div>
                                                        <div class="product_size product_text"><span>Category: </span><%# Eval("Category") %></div>
                                                        <div class="product_price  product_text"><span>Price: </span>€<%# Eval("Price") %></div>
                                                        <div class="product_quantity_container">
                                                            <div class="product_quantity ml-lg-auto mr-lg-auto text-center">
                                                                <span class="product_text product_num" runat="server"><%# Eval("Quantity") %></span>
                                                                <div class="qty_sub qty_button trans_200 text-center"><span><asp:Button ID="btn_decrease" runat="server" Text="-" UseSubmitBehavior="false" CssClass="qty_sub qty_button trans_200 text-center" BorderStyle="None" BorderColor="Transparent" BackColor="Transparent" BorderWidth="0"  CommandName="btn_decrease" /></span></div>
                                                                <div class="qty_add qty_button trans_200 text-center"><span><asp:Button ID="btn_increase" runat="server" Text="+" UseSubmitBehavior="false" CssClass="qty_sub qty_button trans_200 text-center" BorderStyle="None" BorderColor="Transparent" BackColor="Transparent" BorderWidth="0"  CommandName="btn_increase"  /></span></div>
                                                            </div>
                                                        </div>
                                                        <div class="product_total product_text"><span>Total: </span>€ <%# Eval("Total") %></div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <!-- Cart Buttons -->
                                            <div class="cart_buttons d-flex flex-row align-items-start justify-content-start">
                                                <div class="cart_buttons_inner ml-sm-auto d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                    <div>
                                                        <asp:Button ID="btn_clearCart" runat="server" Text="clear cart" CssClass=" btn btn-warning trans_200 mr-4 text-uppercase text-white font-weight-bold" UseSubmitBehavior="false" OnClick="btn_clearCart_Click" /></div>
                                                    <div><a href="HomePage.aspx" class="btn btn-secondary trans_200">Continue shopping</a></div>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <div class="container ">
                            <div class="row cart_extra_row d-flex flex-column align-content-end justify-content-end">

                                <div class="col-lg-6 cart_extra_col">
                                    <div class="cart_extra cart_extra_2">
                                        <div class="cart_extra_content cart_extra_total">
                                            <div class="cart_extra_title">Cart Total</div>
                                            <ul class="cart_extra_total_list">
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Subtotal</div>
                                                    <div class="cart_extra_total_value ml-auto"><span><asp:Label ID="lbl_sub" runat="server"></asp:Label></span></div>
                                                </li>
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Shipping</div>
                                                    <div class="cart_extra_total_value ml-auto">Free</div>
                                                </li>
                                                <li class="d-flex flex-row align-items-center justify-content-start">
                                                    <div class="cart_extra_total_title">Total</div>
                                                    <div class="cart_extra_total_value ml-auto"><span><asp:Label ID="lbl_total" runat="server"></asp:Label></span></</div>
                                                </li>
                                            </ul>
                                           <asp:Button ID="btn_checkout" runat="server" Text="Proceed to Checkout" CssClass="btn btn-success trans_200 btn-block" OnClick="btn_checkout_Click"/>
                                        </div>
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
   
    <script src="../Config/eCommerceDoc/vendor/bootstrap/js/popper.js"></script>
    <script src="../Config/plugins/progressbar/progressbar.min.js"></script>

</body>
</html>
