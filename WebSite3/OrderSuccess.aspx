<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="OrderSuccess.aspx.cs" Inherits="OrderSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <h1>Order Successful</h1>
    <p>please check your Email for your order</p>
    <p>Your Tracking number is:<asp:Label ID="lblTrackNo" runat="server"></asp:Label>
    </p>
    <p>
        <a href="TrackYourOrder.aspx?TrackingID=">
        <asp:LinkButton ID="trackYourOrder" runat="server" OnClick="trackYourOrder_Click">Track Your Order</asp:LinkButton>
       </a>

    </p>






</div>
















</asp:Content>

