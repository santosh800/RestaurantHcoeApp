<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="col-md-12">
        <div style="border-bottom: 1px solid #eaeaec;">
            <h5 class="proNameViewCart">Customer Details For Ordering </h5>
            <label class="col-md-12">Name</label>
            <div class="col-md-12">
                <asp:textbox id="txtName" runat="server" class="form-control" placeholder="Enter Your Name"></asp:textbox>
            </div>
            <label class="col-md-12">Email</label>
            <div class="col-md-12">
                <asp:textbox id="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email"></asp:textbox>
            </div>
             <label class="col-md-12">Phone No.</label>
            <div class="col-md-12">
                <asp:textbox id="txtPhoneNo" runat="server" class="form-control" placeholder="Enter 10 Digits Mobile No"></asp:textbox>
            </div>
              <label class="col-md-12">Address</label>
            <div class="col-md-12">
                <asp:textbox id="txtAddress" runat="server" class="form-control" placeholder="Enter your Address" Height="100"></asp:textbox>
                <br />
            </div>
               <label class="col-md-12">Total Products</label>
            <div class="col-md-12">
                <asp:textbox ID="txtTotalProducts" runat="server" class="form-control" placeholder=""></asp:textbox>
                <br />
            </div>
               <label class="col-md-12">Total Price</label>
            <div class="col-md-12">
                <asp:textbox ID="txtTotalPrice" runat="server" class="form-control" placeholder=""></asp:textbox>
                <br />
            </div>
            <label class="col-md-12">Payment Method</label>
            <div class="form-group col-md-12">
                <asp:CheckBoxList ID="chkBoxList" runat="server">

               <asp:ListItem Text="Cash On Delivery" Value="Cash on Delivery" ></asp:ListItem>
                <asp:ListItem Text="Free Delivery" Value="Free Delivery" Selected="True"></asp:ListItem>
               
                
               

                </asp:CheckBoxList>
               
           </div>
             


           <div class="col-md-12 margin-vert">
             <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"  Class="form-control btn btn-success" OnClick="btnPlaceOrder_Click" />
               <br />
           </div>
          <div class="col-md-12">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
          </div>
      </div>
</div>
    <asp:Label ID="lblAvailableStockAlert" runat="server" Text=""></asp:Label>



<div style="padding-top: 20px;">
<asp:repeater id="repeater1" runat="server">

     <HeaderTemplate>
         <h5 class="proNameViewCart">Items in your Shopping Cart</h5>
     </HeaderTemplate>
<ItemTemplate>
  
        <div class="col-md-12">
            
            <div class="media" style="border: 1px solid #eaeaec;">
                <div class="media-left">
                    <a href="#">
                        <img width="100" height="100" class="media-object"  src="Images/ProductImages/<%#Eval("ProductID") %>/<%#Eval("ImageName") %><%#Eval("ImageExtention") %>" alt="<%#Eval("ImageName") %>">
                    </a>
                &nbsp;</div>
                <div class="media-body">
                    <h1><%#Eval("ProductID") %></h1>
                    <h5 class="media-heading proNameViewCart"><%#Eval("PName") %></h5>
                    <span class="proOgPriceView">Purchases Price:RS <%#Eval("PPrice") %></span><br />
                     <span class="proPriceView">Available Stock: <asp:Label ID="lblAvailableStock" runat="server" Text="10"></asp:Label></span><br />
                    <span class="proPriceView">Selling Price:RS <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("PSelPrice") %>'></asp:Label></span><br />
                    <p>ProductDescription:<%#Eval("PDescription") %></p>
                    <p>ProductDetails:<%#Eval("ProductDetails") %></p>
                    <p>ProductQuantity:
                        <asp:textbox ID="txtQuantity"  runat="server" class="form-control" Text='<%#Eval("ProductQuantity") %>' OnTextChanged="txtProductQuantity_TextChanged_Click"  AutoPostBack="true" Width="60" ></asp:textbox>
                        <asp:HiddenField ID="hfProductID"    runat="server" Value='<%#Eval("ProductID") %>'></asp:HiddenField>
                    </p>
                    <p>
                        <asp:Button ID="btnRemoveFromCart"  CssClass="removeButton" runat="server" Text="Remove From Cart" OnClick="btnRemoveFromCart_Click" CommandArgument='<%#Eval("ProductID") %>'/>
                    </p>
                </div>
            </div>
        </div>
   
</ItemTemplate>
</asp:repeater> 
</div>
</asp:Content>

