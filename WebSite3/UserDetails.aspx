<%@ Page Title="" EnableEventValidation="true" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>User Details</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">User Details</div>

            <asp:Repeater ID="rptrUserDetails" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>UserName</th>
                                <th>Password</th>
                                <th>Email</th>
                                <th>Name</th>
                                <th>UserType</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("Uid") %></th>
                        <td><%# Eval("UserName") %></td>
                        <th><%#Eval("Password") %></th>
                        <th><%#Eval("Email") %></th>
                        <th><%#Eval("Name") %></th>
                        <th><%#Eval("UserType") %></th>
                        <td><a href="EditUserDetails.aspx?Uid=<%#Eval("Uid") %>">Edit</a></td>
                        <td>

                     <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("Uid") %>'/>

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

