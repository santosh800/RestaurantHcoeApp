<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddEmployees.aspx.cs" Inherits="AddEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Employees</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lblEmpName" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpName" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpName"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblEmpEmail" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpEmail" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmpAddress" runat="server" CssClass="col-md-2 control-label" Text="Address"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpAddress" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpAddress"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblEmpPhoneNo" runat="server" CssClass="col-md-2 control-label" Text="Phone No."></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpPhoneNo" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpPhoneNo" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpPhoneNo"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <asp:Label ID="lblEmpDescription" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpDescription" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpDes" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpDescription"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <asp:Label ID="lblEmpSalary" runat="server" CssClass="col-md-2 control-label" Text="Salary"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpSalary" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpSalary" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpSalary"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <asp:Label ID="lblEmpType" runat="server" CssClass="col-md-2 control-label" Text="Employee Type"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpType" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpType" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpType"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <asp:Label ID="lblEmpSpec" runat="server" CssClass="col-md-2 control-label" Text="Employee Specific"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtEmpSpec" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmpSpec" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpSpec"></asp:RequiredFieldValidator>
                </div>
            </div>
              <div class="form-group">
                <asp:Label ID="lblEmpImage" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="txtEmpImage" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1EmpImage" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtEmpImage"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click"  />
                </div>
            </div>
             <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                  <asp:Label ID="lblEmpError" runat="server"></asp:Label>
                </div>
            </div>
        </div>

        <h1>Employees Details</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">All Brands</div>

            <asp:Repeater ID="rptrEmployeesDetails" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>PhoneNo</th>
                                <th>Desc</th>
                                <th>Salary</th>
                                <th>Employee Type</th>
                                <th>EmpSpec</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%#Eval("EmpID") %></th>
                        <td><%#Eval("EmpName") %></td>
                        <td><%#Eval("EmpEmail") %></td>
                        <td><%#Eval("EmpAddress") %></td>
                        <td><%#Eval("EmpPhoneNo") %></td>
                        <td><%#Eval("EmpDescription") %></td>
                        <td><%#Eval("EmpSalary") %></td>
                        <td><%#Eval("EmpType") %></td>
                        <td><%#Eval("Empspec") %></td>
                        <td><a href="EditEmployees.aspx?EmpID=<%#Eval("EmpID") %>">Edit</a></td>
                        <td> <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%#Eval("EmpID") %>'
                            /></td>
                        
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

