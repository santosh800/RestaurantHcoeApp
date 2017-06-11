<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderUserControl.ascx.cs" Inherits="OrderUserControl" %>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>


<asp:UpdatePanel ID="UpdatePanel3" runat="server">

    <ContentTemplate>
        <div align="center">
            <asp:Label ID="lblTransactionNo" runat="server" Text="TransactionNo:" Style="font-weight:700;"></asp:Label>
            <asp:TextBox ID="txtTransactionNo" runat="server" Width="90px" Text=""></asp:TextBox>
            <asp:Button ID="btnGo" runat="server" Text="GO!"  Width="36px" Style="font-weight:700" OnClick="btnGo_click"/>&nbsp;
        </div>
        <div runat="server" align="center">
                    <hr />
                    <asp:RadioButtonList ID="rblOrderDetails" RepeateDirection="Horizontal" runat ="server" AutoPostBack="True" OnSelectedIndexChanged="rblOrderDetail_SelectedIndexChanged" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">CustomerDetails</asp:ListItem>
                        <asp:ListItem Value="2">ProductDetails</asp:ListItem>
                        <asp:ListItem Value="3">DeliveryStatus</asp:ListItem>
                         </asp:RadioButtonList>
                    <hr />
            <br />
        </div>
       <!--Panel1 for displaying customer details-->
       
                <asp:Panel ID="Panel1" runat="server">
             <div class="container">
                   <div align="center">
                           <asp:Image ID="Image1" runat="server" ImageUrl="~/images/person-icon-1675.png" Height="100px" Width="100px"/>
                                    
                        </div>
            <div class="panel panel-default" align="center">
            <!-- Default panel contents -->
            <div class="panel-heading">Customer Details</div>
                            <table class="tabel" align="center">
                                
                     
                                <tr>
                                     <th align="left" style="width:50%; padding-right:30px;">Name</th>
                                    <td align="right" style="width:50%"> <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label></td>
                                 </tr>
                            
                                <tr>
                                    <th align="left" style="width:50%; padding-right:30px;">Email</th>
                                    <td align="right" style="width:50%;"><asp:Label ID="lblCustomerEmailId" runat="server" Text=""></asp:Label> </td>
                                </tr>
                                <tr>
                                    <th align="left" style="width:50%;padding-right:30px;">Phoneno</th>
                                    <td align="right" style="width:50%;"><asp:Label ID="lblCustomerPhoneNo" runat="server" Text=""></asp:Label></td>
                               </tr>
                                <tr> <th align="left" style="width:50%; padding-right:30px;">Total Product</th>
                                    <td align="right" style="width:50%"><asp:Label ID="lblTotalProducts" runat="server" Text=""></asp:Label> </td>
                               </tr>
                                <tr>
                                    <th align="left" style="width:50%; padding-right:30px;">Total Price</th>
                                    <td align="right" style="width:50%"><asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label></td>
                               </tr>
                               <tr> <th align="left" style="width:50%; padding-right:30px;">Address</th>
                                    <td align="right" style="width:50%"> <asp:Label ID="lblCustomerAddress" runat="server"></asp:Label></td>
                                </tr>
                               <tr><th align="left" style="width=50%;padding-right:30px">PaymentMethod</th>
                                    <td align="right" style="width=50%;"><asp:Label ID="lblPayMentMethod" runat="server" Text=""></asp:Label> </td>
                                </tr>
                            
                     </table> 
                  </div>
                 
             </div>
        </asp:Panel>
      
        <!--Panel2 for displaying product order by Customer-->
        <asp:Panel ID="Panel2" runat="server">
        <div class="container">  
            <div align="center">
                <img runat="server" src="~/images/productImage.png"  height="100" width="100"/>
            </div>      
            <asp:DataList ID="dlProducts" runat="server">
              <ItemTemplate>
                  <div class="col-sm-3 col-md-3">
                    <a style="text-decoration:none;" href="ProductView.aspx?PID=<%#Eval("PID") %>">
                    <div class="thumbnail">
                        <img src='Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>' alt='<%#Eval("Name") %>'  runat="server" />
                        <div class="caption">
                            <div><asp:Label ID="lblProductsName" runat="server" Text='<%#Eval("PName") %>'></asp:Label></div>
                            <div><span>quantity:<asp:Label ID="lblQuantity" runat="server"  Text='<%#Eval("ProductQuantity") %>'><span></span></asp:Label></div>
                            <div><span>price:<asp:Label ID="lblPrice" runat="server"  Text='<%#Eval("PSelPrice") %>'></asp:Label></span></div>
                            </div>
                    </div>
                   </a>
                </div>

              </ItemTemplate>
         </asp:DataList>
        </div>
      </asp:Panel>
        <!--panel3 for Transaction Status-->
        <asp:Panel ID="Panel3" runat="server">
            <div class="container">
                    <div align="center">
                       <asp:Image ID="Image3" runat="server"  ImageUrl="~/images/delivery-truck.jpg" Height="100px" Width="100px"></asp:Image>
                    </div>
                <div align="center">
                    <asp:TextBox ID="txtStatus" runat="server" Width="300px"></asp:TextBox>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" Width="36px" style="font-weight:700;" OnClick="btnAdd_Click">
                   </asp:Button>
               </div>
         <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">DeliveryStatus</div>

            <asp:Repeater ID="rptrDelivery" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>

                                <th>Status Message</th>
                                <th>Delivery Date</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                       
                        <td><%# Eval("shipMentStatus") %></td>
                        <td><%#Eval("updateOn") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>      
                            
                           

                      
                </div>
                    </asp:Panel>
        <!--Panel4 for no result found-->
        <asp:Panel ID="Panel4" runat="server">
            <div class="container">
                        <div align="center">
                           <asp:Image ID="Image4" runat="server" ImageUrl="~/images/icon_no_result.jpg"  />
                                    
                        </div>
                            
                       
                </div>
        </asp:Panel>
        
    </ContentTemplate>
</asp:UpdatePanel>

