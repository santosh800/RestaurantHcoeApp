﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SignUp</title>

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
            <li><a href="#">Shirt</a></li>
            <li><a href="#">Pants</a></li>
             <li><a href="#">Denims</a></li>
             <li class="dropdown-header">Women</li>
             <li role="separator" class="divider"></li>
              <li><a href="#">Top</a></li>
              <li><a href="#">Pants</a></li>
              <li><a href="#">Denims</a></li>
          </ul>
        </li><!-- end of the dropdown-->
          <li><a href="SignUp.aspx">Sign Up</a></li>
          <li><a href="SignIn.aspx">Sign In</a></li>
          
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav><!-- end of nav-->
<br />
<!-- signup-->
<div class="center-page">
    
    <label class="col-xs-11">UserName</label>
    <div class="col-xs-11">
    <asp:TextBox ID="tbUname" runat ="server" class="form-control" placeholder="username"></asp:TextBox>
    </div>
    <label class="col-xs-11">Password</label>
    <div class="col-xs-11">
    <asp:TextBox ID="tbPass" runat ="server" class="form-control" placeholder="password" TextMode="Password"></asp:TextBox>
    </div>
    <label class="col-xs-11">Conform Password</label>
    <div class="col-xs-11">
    <asp:TextBox ID="tbCPass" runat ="server" class="form-control" placeholder="conform password" TextMode="Password"></asp:TextBox>
    </div>
    <label class="col-xs-11">Name</label>
    <div class="col-xs-11">
    <asp:TextBox ID="tbName" runat ="server" class="form-control" placeholder="name"></asp:TextBox>
    </div>

    <label class="col-xs-11">Email</label>
    <div class="col-xs-11">
    <asp:TextBox ID="tbEmail" runat ="server" class="form-control" placeholder="email" TextMode="Email"></asp:TextBox>
        <br />
    </div>
    <div class="col-xs-11 margin-vert">
    <asp:Button ID="btSubmit" runat="server" Text="Sign Up"  Class="form-control btn btn-success" OnClick="btSubmit_Click"/>
    </div>
    <br />
    <div class="col-xs-11">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </div>




</div>

<!-- end signup-->
        
 </div>
 <!--end topdiv -->

        

        




         <hr />
        <!-- start footer-->
        <footer class="footer-pos">
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
