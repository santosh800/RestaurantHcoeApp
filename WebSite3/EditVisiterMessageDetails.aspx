<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="EditVisiterMessageDetails.aspx.cs" Inherits="EditVisiterMessageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <h2>Update Visiter Message</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lblUserName" runat="server" CssClass="col-md-2 control-label" Text="UserName"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblMobileNo" runat="server" CssClass="col-md-2 control-label" Text="Mobile No."></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtMobileNo" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobileNo" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobileNo"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" CssClass="col-md-2 control-label" Text="Message"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtMessage" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMessage" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-default" OnClick="btnUpdate_Click" />
                </div>
            </div>
              <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Label ID="lblMessage2" runat="server" ></asp:Label>
                </div>
            </div>
        </div>

        <h1>Upadate Visiter Message</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Update Visiter Message</div>

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
                                <th>SendDateTime</th>
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
                        <td><a href="EditVisiterMessageDetails.aspx?Uid=<%#Eval("Id") %>">Edit</a></td>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("Id") %>'/>

                        </td>
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

