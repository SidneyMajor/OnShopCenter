﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmEmail.aspx.cs" Inherits="OnShopCenter.Home.ConfirmEmail" %>

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

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,900" rel="stylesheet" />

    <!-- Custom stlylesheet -->
    <link href="../Config/eCommerceDoc/css/style.css" rel="stylesheet" />
    <link href="../Config/eCommerceDoc/bootstrap-4.5.2-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../Config/eCommerceDoc/fonts/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div id="notfound">
            <div class="notfound">
                <div class="notfound-404">
                    <h1>Welcame!</h1>
                </div>
                <h1 class="text-center text-primary m-3"><i class="fa fa-shopping-bag"></i> On Shop Center</h1>
                <h2><i class="fa fa-users m-2"></i><asp:Label id="lbl_mensager" runat="server" Text=""></asp:Label></h2>
                <p class="text-capitalize text-success" style="font-size:large">Conta ativada com sucesso!</p>
                <a href="HomePage.aspx">Go To Homepage</a>
            </div>
        </div>
    </form>
</body>
</html>
