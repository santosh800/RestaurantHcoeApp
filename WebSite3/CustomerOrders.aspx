<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="CustomerOrders.aspx.cs" Inherits="CustomerOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
       <h1>Customer Order Details</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Customer Order Details</div>

            <asp:Repeater ID="rptrCustomerOrder" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#Id</th>
                                <th>Name</th>
                                <th>Total Products</th>
                                <th>Total Price</th>
                                <th>Order Date</th>
                                <th>PaymentMethod</th>
                                <th>View Details</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("ID") %></th>
                        <td><%# Eval("CustomerName") %></td>
                        <td><%#Eval("TotalProducts") %></td>
                        <td><%# Eval("TotalPrice") %></td>
                        <td><%#Eval("OrderDateTime") %></td>
                        <td><%#Eval("PaymentMethod") %></td>
                        <td><a href="ViewOrderDetails.aspx?TrackingID=<%#Eval("ID") %>">View Details</a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
















</asp:Content>

