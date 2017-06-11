<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="EditUserDetails.aspx.cs" Inherits="EditUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <h2>Update User Details</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lblUserName" runat="server" CssClass="col-md-2 control-label" Text="UserName"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblPassWord" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
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
                <asp:Label ID="lblName" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblUserType" runat="server" CssClass="col-md-2 control-label" Text="UserType"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtUserType" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserType" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtUserType"></asp:RequiredFieldValidator>
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
                    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                </div>
            </div>
        </div>

        <h1>Upadate User Details</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">Update User Details</div>

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
                        <td><%#Eval("Password") %></td>
                        <td><%#Eval("Email") %></td>
                        <td><%#Eval("Name") %></td>
                        <td><%#Eval("UserType") %></td>
                        <td><a href="EditUserDetails.aspx?Uid=<%#Eval("Uid") %>">Edit</a></td>
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

