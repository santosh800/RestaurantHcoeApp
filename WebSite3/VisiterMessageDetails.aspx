<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="VisiterMessageDetails.aspx.cs" Inherits="VisiterMessageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <h1>User Details</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">User Details</div>

            <asp:Repeater ID="rptrVisiterMessageDetails" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>UserName</th>
                                <th>Email</th>
                                <th>MobileNo</th>
                                <th>Message</th>
                                <th>Send DateTime</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("Id") %></th>
                        <td><%# Eval("UserName") %></td>
                        <td><%#Eval("Email") %></td>
                        <td><%#Eval("MobileNo") %></td>
                        <td><%#Eval("Message") %></td>
                        <td><%#Eval("SendDateTime") %></td>
                        <td><a href="EditVisiterMessageDetails.aspx?Id=<%#Eval("Id") %>">Edit</a></td>
                        <td>

                     <asp:Button ID="btnDelete" runat="server" Text="Delete"  OnClick="btnDelete_Click"  CommandArgument='<%#Eval("Id") %>'/>

                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>


















</asp:Content>

