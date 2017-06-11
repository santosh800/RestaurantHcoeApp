<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                 <p class="lead">
                        <a href="ViewCart.Aspx"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i>
                            
                           [ <asp:linkbutton ID="btnShoppingHeart" runat="server" Text="" OnClick="btnShoppingHeart_Click"></asp:linkbutton>] Item in your cart
                        </a>
                 </p>
    
     <div class="col-md-12">

              <div class="thumbnail" >
                  
                     <div id="carousel-example-generic" class="carousel slide"  data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <asp:Repeater ID="rptrImages" runat="server" >
                            <ItemTemplate>
                                <div class="item <%# GetActiveClass(Container.ItemIndex) %>">
                                    <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                      
                 <div class="caption-full">
                <asp:Repeater ID="rptrProductDetails" OnItemDataBound="rptrProductDetails_ItemDataBound" runat="server" >
                <ItemTemplate>
                    <div class="divDet1">
                        <h1 class="proNameView"><%#Eval("PName") %></h1>
                        <p class="pull-right">
                        <span class="proOgPriceView">RS <%#Eval("PPrice") %></span><br />
                           <span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %> OFF</span><br />
                        <span class="proPriceView">RS <%#Eval("PSelPrice") %></span>
                        </p>
                    </div>
                    <div>
                        <h5 class="h5Size">SIZE</h5>
                        <div>
                            <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="divDet1">
                        <asp:Button ID="btnAddToCart"  OnClick="btnAddToCart_Click" CssClass="mainButton" runat="server" Text="ADD TO CART" />
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="divDet1">
                        <h5 class="h5Size">Description</h5>
                        <p>
                            <%#Eval("PDescription") %>
                        </p>
                        <h5 class="h5Size">Product Details</h5>
                        <p>
                            <%#Eval("PProductDetails") %>
                        </p>
                        <h5 class="h5Size">Material & Care</h5>
                        <p>
                            <%#Eval("PMaterialCare") %>
                        </p>
                    </div>
                    <div>
                        <p><%# ((int)Eval("FreeDelivery")==1)?"Free Delivery":"" %></p>
                        <p><%# ((int)Eval("30DayRet")==1)?"30 Days Returns":"" %></p>
                        <p><%# ((int)Eval("COD")==1)?"Cash on Delivery":"" %></p>
                    </div>

                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("PcategoryID") %>' runat="server" />
                    <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />
                    <asp:HiddenField ID="hfGenderID" Value='<%# Eval("PGender") %>' runat="server" />
                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                    <asp:HiddenField ID="hfProductID" Value='<%# Eval("PID") %>' runat="server" />
                </ItemTemplate>
            </asp:Repeater>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            4.0 stars
                        </p>
                    </div>
                </div>

   </div>
   


                

     
    
</asp:Content>

