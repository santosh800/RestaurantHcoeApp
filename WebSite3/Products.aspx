<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                      <div class="container">
                            <div class="row">
                                <div class="col-md-9 text-center">
                                    <h2 class="page-header">All Products
                                    </h2>
                                </div>

                            </div>
                        </div>
     <div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                    <a style="text-decoration:none;" href="ProductView.aspx?PID=<%#Eval("PID") %>">
                    <div class="thumbnail">
                        <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("ImageName") %>">
                        <div class="caption">
                            <div class="probrand"><%#Eval("BrandName") %></div>
                            <div class="proName"><%#Eval("PName") %></div>
                            <div class="proPrice"><span class="proOgPrice"><%#Eval("PPrice") %></span> <%#Eval("PSelPrice") %> <span class="proPriceDiscount">(<%#Eval("DiscAmount") %>  Off)</span></div>
                            
                            <div class="col-xs-11 margin-vert">
                                <a href="ProductView.aspx?PID=<%#Eval("PID") %>"  >
                                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD To Cart" class="form-control btn btn-default"/>

                                </a>
                            </div>
                        </div>
                       
                        <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                         </div>
                    </div>
                        </a>
                </div>
                  <asp:HiddenField ID="htProductID" Value='<%# Eval("PID") %>' runat="server" />
            </ItemTemplate>
        </asp:Repeater>
    </div>









</asp:Content>

