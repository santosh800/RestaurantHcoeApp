<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign In</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/customcss.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">eShopNepal</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a class="active" href="Default.aspx">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="Contact.aspx">Contact</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Products <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li class="dropdown-header">Men</li>
            <li><a href="Products.aspx">GetProduct</a></li>
            <li><a href="#">Pants</a></li>
             <li><a href="#">Denims</a></li>
             <li class="dropdown-header">Women</li>
             <li role="separator" class="divider"></li>
              <li><a href="#">Top</a></li>
              <li><a href="#">Pants</a></li>
              <li><a href="#">Denims</a></li>
          </ul>
        </li><!-- end of the dropdown-->
         
          <li><a href="SignIn.aspx">Sign In</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!-- end of nav-->
    </div>
        <!-- sign in-->
        <div class="container">
            <div class="form-horizontal">
                <h2>LogIn</h2>
                <hr />
                <div class="form-group">
                <asp:Label ID="Label1" runat="server" class="col-md-2 control-label" Text="UserName"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="UserName" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ErrorMessage="UserName Field is Required" ControlToValidate="UserName" Class="text-danger"></asp:RequiredFieldValidator>

                </div>
              </div>

                <div class="form-group">
                <asp:Label ID="Label2" runat="server" class="col-md-2 control-label" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="Password" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Password Field is Required"  Class="text-danger" ControlToValidate="Password"></asp:RequiredFieldValidator>
                    
                </div>
             </div>

                <div class="form-group">
                
                
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <asp:Label ID="Label3" runat="server" class="control-label" Text="Remember me ?"></asp:Label>
                    </div>
             </div>
                <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    
                    <asp:Button ID="Button1" runat="server" Text="LogIn" class="btn btn-success" OnClick="Button1_Click"/>
                    <asp:LinkButton ID="LinkToSignUp" runat="server" class="btn btn-success" PostBackUrl="~/SignUp.aspx">SignUP</asp:LinkButton>
                </div>
             </div>
                <div class="form-group">
                <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="~/ForgotPassword.aspx">Forgot Password?</asp:LinkButton>
                 </div>
             </div>
                <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    
                </div>
             </div>




            </div><!--form horizantal-->





        </div>







        <!--end sign in-->



         <hr />
        <!-- start footer-->
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Go TOP</a></p>
                <p>&copy;2015 eShopNepal.com &middot;<a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Product</a></p>
            </div>
        </footer>
        <!--end footer-->
    </form>

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>






</body>
</html>
