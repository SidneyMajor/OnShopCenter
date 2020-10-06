<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestUser.aspx.cs" Inherits="OnShopCenter.BackOffice.GestUser" %>

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
    <link href="../Config/eCommerceDoc/bootstrap-4.5.2-dist/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />

</head>
<body>
    <form id="form1" runat="server" class="login100-form validate-form p-b-33 p-t-5">

        <div class="ml-5">

            <div class="row">
                <div class="col-12">
                    <div class="mt-2">
                        <asp:Label ID="lbl_Erro" runat="server" CssClass="label-input100 text-center" Font-Size="X-Large"></asp:Label>
                    </div>
                    <button class="btn btn-primary mb-2" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Insert Product
                    </button>
                    <div class="row">
                        <div class="col-md-7">
                            <div class="collapse validate-form" id="collapseExample">
                                <div class="card card-body">

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1"></span>
                                        </div>
                                        <input type="text" class="form-control" placeholder="Product Name" aria-label="ProductName" aria-describedby="basic-addon1" runat="server" id="productname" required="required" />
                                    </div>



                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon2">Category</span>
                                        </div>
                                        <asp:DropDownList ID="ddl_category" runat="server" CssClass="form-control" aria-label="Category" aria-describedby="basic-addon2" required="required" DataSourceID="SqlDataSource1" DataTextField="description" DataValueField="categoryId"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon3">€</span>
                                        </div>
                                        <input type="number" class="form-control" step="0.01" placeholder="0.00" aria-label="Price" aria-describedby="basic-addon3" runat="server" id="price" required="required" />
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon4"></span>
                                        </div>
                                        <input type="text" aria-multiline="true" class="form-control" placeholder="Description" aria-label="Description" aria-describedby="basic-addon4" runat="server" id="description" />
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon5">#</span>
                                        </div>
                                        <input type="number" class="form-control" step="1" placeholder="0" aria-label="Quantity" aria-describedby="basic-addon5" runat="server" id="quantity" />
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon6">Image</span>
                                        </div>
                                        <input type="file" accept="image/*" class="form-control" aria-describedby="basic-addon6" runat="server" id="image" />
                                    </div>

                                    <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btn_Save_Click" />

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="card badge-secondary m-2">
                    <div class="card-body badge-info">
                        <div class="col-12">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
                                <HeaderTemplate>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Products</h3>
                                        </div>
                                        <div class="panel-body">
                                            <table class="table table-hover table-responsive table-striped " id="MyTable">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>
                                                            Product Name
                                                        </th>
                                                        <th>
                                                            Category
                                                        </th>
                                                        <th>
                                                            Price
                                                        </th>
                                                        <th>
                                                            Description
                                                        </th>
                                                        <th>
                                                            Quantity
                                                        </th>                                                        
                                                        <th>
                                                            <asp:Button ID="btn_saveall" runat="server" Text="Save All" CssClass="btn btn-sm btn-primary" OnClick="btn_saveall_Click" UseSubmitBehavior="false" />
                                                        </th>
                                                    </tr>
                                                </thead>
                                </HeaderTemplate>

                                <ItemTemplate>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lbl_productId" runat="server" Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tproduct_nome" ReadOnly="true"> </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tcategory" ReadOnly="true"> </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tprice" ReadOnly="true"> </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tdescription" ReadOnly="true"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="tquantity" TextMode="Number" ReadOnly="true"> </asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_save" runat="server" Text="Save" CssClass="btn btn-sm btn-success" CommandName="btn_save" UseSubmitBehavior="false" Visible="false" />

                                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CssClass="btn btn-sm btn-warning" CommandName="btn_edit" UseSubmitBehavior="false" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="btn_delete" UseSubmitBehavior="false" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>

                                <FooterTemplate>
                                    </table>
                         
                               </div>
                            </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OnShopCenterConnectionString %>" SelectCommand="GetProduct" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>

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
    <script src="../Config/eCommerceDoc/bootstrap-4.5.2-dist/js/bootstrap.js"></script>
    <script src="../Config/eCommerceDoc/bootstrap-4.5.2-dist/js/bootstrap.bundle.js"></script>
    <script src="../Config/eCommerceDoc/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="../Config/eCommerceDoc/js/jquery-1.11.0.min.js"></script>

    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MyTable').DataTable();
        });
    </script>
</body>
</html>
