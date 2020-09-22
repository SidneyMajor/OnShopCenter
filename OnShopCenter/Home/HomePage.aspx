﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnShopCenter.Home.HomePage" %>

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

    <link rel="icon" type="image/png" href="/Config/eCommerceDoc/images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/bootstrap-4.1.2/bootstrap.min.css" />
    <link href="/Config/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/owl.theme.default.css" />
    <link rel="stylesheet" type="text/css" href="/Config/plugins/OwlCarousel2-2.2.1/animate.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/main_styles.css" />
    <link rel="stylesheet" type="text/css" href="/Config/styles/responsive.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="menu">

            <!-- Search -->
            <div class="menu_search">
                <div id="menu_search_form" class="menu_search_form">
                    <input type="text" class="search_input" placeholder="Search Item" required="required" />
                    <button class="menu_search_button">
                        <img src="/Config/images/search.png" alt="" /></button>
                </div>
            </div>
            <!-- Navigation -->
            <div class="menu_nav">
                <ul>
                    <li><a href="#">Women</a></li>
                    <li><a href="#">Men</a></li>
                    <li><a href="#">Kids</a></li>
                    <li><a href="#">Home Deco</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <!-- Contact Info -->
            <div class="menu_contact">
                <div class="menu_phone d-flex flex-row align-items-center justify-content-start">
                    <div>
                        <div>
                            <img src="images/phone.svg" alt="https://www.flaticon.com/authors/freepik" />
                        </div>
                    </div>
                    <div>+1 912-252-7350</div>
                </div>
                <div class="menu_social">
                    <ul class="menu_social_list d-flex flex-row align-items-start justify-content-start">
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="super_container">

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
                                <div>Little Closet</div>
                            </div>
                        </a>
                    </div>
                    <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                    <nav class="main_nav">
                        <ul class="d-flex flex-row align-items-start justify-content-start">
                            <li class="active"><a href="#">Women</a></li>
                            <li><a href="#">Men</a></li>
                            <li><a href="#">Kids</a></li>
                            <li><a href="#">Home Deco</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                    <div class="header_right d-flex flex-row align-items-center justify-content-start ml-auto">
                        <!-- Search -->
                        <div class="header_search">
                            <div id="header_search_form">
                                <input type="text" class="search_input" placeholder="Search Item" required="required" />
                                <button class="header_search_button">
                                    <img src="/Config/images/search.png" alt="" /></button>
                            </div>
                        </div>
                        <!-- User -->
                        <div class="user">
                            <a href="/Home/Login.aspx">
                                <div>
                                    <img src="/Config/images/user.svg" alt="https://www.flaticon.com/authors/freepik" /><div></div>
                                </div>
                            </a>
                        </div>
                        <!-- Cart -->
                        <div class="cart">
                            <a href="cart.html">
                                <div>
                                    <img class="svg" src="/Config/images/cart.svg" alt="https://www.flaticon.com/authors/freepik" />
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

                <!-- Home -->

                <div class="home">
                    <!-- Home Slider -->
                    <div class="home_slider_container">
                        <div class="owl-carousel owl-theme home_slider">

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image: url(/Config/images/home.jpg)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">New Arrivals</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_1.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image">
                                                                        <img src="/Config/images/home_2.jpg" alt="" />
                                                                    </div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/heart.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/cart_2.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_3.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image: url(/Config/images/home.jpg)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Popular</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_1.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image">
                                                                        <img src="/Config/images/product_1.jpg" alt="" />
                                                                    </div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/heart.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/cart_2.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_3.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image: url(/Config/images/home.jpg)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Trendsetters</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_1.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image">
                                                                        <img src="/Config/images/product_2.jpg" alt="" />
                                                                    </div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/heart.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/cart_2.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_3.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Slide -->
                            <div class="owl-item">
                                <div class="background_image" style="background-image: url(/Config/images/home.jpg)"></div>
                                <div class="container fill_height">
                                    <div class="row fill_height">
                                        <div class="col fill_height">
                                            <div class="home_container d-flex flex-column align-items-center justify-content-start">
                                                <div class="home_content">
                                                    <div class="home_title">Premium Items</div>
                                                    <div class="home_subtitle">Summer Wear</div>
                                                    <div class="home_items">
                                                        <div class="row">
                                                            <div class="col-sm-3 offset-lg-1">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_1.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-8 offset-sm-2 offset-md-0">
                                                                <div class="product home_item_large">
                                                                    <div class="product_tag d-flex flex-column align-items-center justify-content-center">
                                                                        <div>
                                                                            <div>from</div>
                                                                            <div>$3<span>.99</span></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product_image">
                                                                        <img src="/Config/images/product_3.jpg" alt="" />
                                                                    </div>
                                                                    <div class="product_content">
                                                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                                                            <div>
                                                                                <div>
                                                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ml-auto text-right">
                                                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                                                <div class="product_price text-right">$3<span>.99</span></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product_buttons">
                                                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/heart.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                                                    <div>
                                                                                        <div>
                                                                                            <img src="/Config/images/cart_2.svg" alt="" /><div>+</div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="home_item_side">
                                                                    <a href="product.html">
                                                                        <img src="/Config/images/home_3.jpg" alt="" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="home_slider_nav home_slider_nav_prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></div>
                        <div class="home_slider_nav home_slider_nav_next"><i class="fa fa-chevron-right" aria-hidden="true"></i></div>

                        <!-- Home Slider Dots -->

                        <div class="home_slider_dots_container">
                            <div class="container">
                                <div class="row">
                                    <div class="col">
                                        <div class="home_slider_dots">
                                            <ul id="home_slider_custom_dots" class="home_slider_custom_dots d-flex flex-row align-items-center justify-content-center">
                                                <li class="home_slider_custom_dot active">01</li>
                                                <li class="home_slider_custom_dot">02</li>
                                                <li class="home_slider_custom_dot">03</li>
                                                <li class="home_slider_custom_dot">04</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Products -->

                <div class="products">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-3">
                                <div class="section_title text-center">Popular on Little Closet</div>
                            </div>
                        </div>
                        <div class="row page_nav_row">
                            <div class="col">
                                <div class="page_nav">
                                    <ul class="d-flex flex-row align-items-start justify-content-center">
                                        <li class="active"><a href="category.html">Women</a></li>
                                        <li><a href="category.html">Men</a></li>
                                        <li><a href="category.html">Kids</a></li>
                                        <li><a href="category.html">Home Deco</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row products_row">

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_1.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_2.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_3.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_4.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_5.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product -->
                            <div class="col-xl-4 col-md-6">
                                <div class="product">
                                    <div class="product_image">
                                        <img src="/Config/images/product_6.jpg" alt="" />
                                    </div>
                                    <div class="product_content">
                                        <div class="product_info d-flex flex-row align-items-start justify-content-start">
                                            <div>
                                                <div>
                                                    <div class="product_name"><a href="product.html">Cool Clothing with Brown Stripes</a></div>
                                                    <div class="product_category">In <a href="category.html">Category</a></div>
                                                </div>
                                            </div>
                                            <div class="ml-auto text-right">
                                                <div class="rating_r rating_r_4 home_item_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                                <div class="product_price text-right">$3<span>.99</span></div>
                                            </div>
                                        </div>
                                        <div class="product_buttons">
                                            <div class="text-right d-flex flex-row align-items-start justify-content-start">
                                                <div class="product_button product_fav text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="images/heart_2.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product_button product_cart text-center d-flex flex-column align-items-center justify-content-center">
                                                    <div>
                                                        <div>
                                                            <img src="/Config/images/cart.svg" class="svg" alt="" /><div>+</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row load_more_row">
                            <div class="col">
                                <div class="button load_more ml-auto mr-auto"><a href="#">load more</a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Boxes -->

                <div class="boxes">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="boxes_container d-flex flex-row align-items-start justify-content-between flex-wrap">

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="background_image" style="background-image: url(/Config/images/box_1.jpg)"></div>
                                        <div class="box_content d-flex flex-row align-items-center justify-content-start">
                                            <div class="box_left">
                                                <div class="box_image">
                                                    <a href="category.html">
                                                        <div class="background_image" style="background-image: url(/Config/images/box_1_img.jpg)"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="box_right text-center">
                                                <div class="box_title">Trendsetter Collection</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="background_image" style="background-image: url(/Config/images/box_2.jpg)"></div>
                                        <div class="box_content d-flex flex-row align-items-center justify-content-start">
                                            <div class="box_left">
                                                <div class="box_image">
                                                    <a href="category.html">
                                                        <div class="background_image" style="background-image: url(/Config/images/box_2_img.jpg)"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="box_right text-center">
                                                <div class="box_title">Popular Choice</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="background_image" style="background-image: url(/Config/images/box_3.jpg)"></div>
                                        <div class="box_content d-flex flex-row align-items-center justify-content-start">
                                            <div class="box_left">
                                                <div class="box_image">
                                                    <a href="category.html">
                                                        <div class="background_image" style="background-image: url(/Config/images/box_3_img.jpg)"></div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="box_right text-center">
                                                <div class="box_title">Popular Choice</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
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
                                                    <div>Little Closet</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="footer_about_text">
                                            <p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse potenti. Fusce venenatis vel velit vel euismod.</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Footer Links -->
                                <div class="col-lg-4 footer_col">
                                    <div class="footer_menu">
                                        <div class="footer_title">Support</div>
                                        <ul class="footer_list">
                                            <li>
                                                <a href="#">
                                                    <div>
                                                        Customer Service<div class="footer_tag_1">online now</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div>Return Policy</div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div>
                                                        Size Guide<div class="footer_tag_2">recommended</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div>Terms and Conditions</div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div>Contact</div>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <!-- Footer Contact -->
                                <div class="col-lg-4 footer_col">
                                    <div class="footer_contact">
                                        <div class="footer_title">Stay in Touch</div>
                                        <div class="newsletter">
                                            <div id="newsletter_form" class="newsletter_form">
                                                <input type="email" class="newsletter_input" placeholder="Subscribe to our Newsletter" required="required" />
                                                <button class="newsletter_button">+</button>
                                            </div>
                                        </div>
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
                                            All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                        </div>
                                        <nav class="footer_nav ml-md-auto order-md-2 order-1">
                                            <ul class="d-flex flex-row align-items-center justify-content-start">
                                                <li><a href="category.html">Women</a></li>
                                                <li><a href="category.html">Men</a></li>
                                                <li><a href="category.html">Kids</a></li>
                                                <li><a href="category.html">Home Deco</a></li>
                                                <li><a href="#">Contact</a></li>
                                            </ul>
                                        </nav>
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
    <script src="/Config/styles/bootstrap-4.1.2/popper.js"></script>
    <script src="/Config/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
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
</body>
</html>