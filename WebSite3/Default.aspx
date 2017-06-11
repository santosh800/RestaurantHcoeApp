<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/shop-homepage.css" rel="stylesheet" />
    <link href="css/customcss.css" rel="stylesheet" />
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

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
                        </li>
                        <!-- end of the dropdown-->
                        <li><a href="SignUp.aspx">Sign Up</a></li>
                        <li><a href="SignIn.aspx">Sign In</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <!-- end of nav-->
        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <!--start of first row-->

                <div class="col-md-3">
                    <p class="lead">
                        <a href="Signin.aspx"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i>[3] Item in your cart</a>
                       
                    </p>
                    <div class="list-group">
                        <a href="#" class="list-group-item">Category 1</a>
                        <a href="#" class="list-group-item">Category 2</a>
                        <a href="#" class="list-group-item">Category 3</a>
                    </div>
                    <div class="list-group">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>

                                <a href="#" class="list-group-item"><%#Eval("BrandName") %></a>

                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
                </div>

                <div class="col-md-9">
                    <!--start of the col-md-9-->

                    <div class="row carousel-holder">
                        <!--start of the carousel-holder-->

                        <div class="col-md-12">
                            <!--carosule-->
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" role="listbox">
                                    <div class="item active">
                                        <img src="images/strawberry_900x300.jpg" alt="image01" />
                                        <div class="carousel-caption">
                                            <h3>Iphone 7 Launch</h3>
                                            <p>Explore iphone,the wrold most powerful personal device.check out iphone 7,iphone 7 plus</p>
                                            <p><a class="btn btn-sm btn-success" role="button" href="SignIn.aspx">Log In</a></p>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="images/food_kebab_900x300.jpg" alt="image02" />
                                        <div class="carousel-caption">
                                            <h3>Iphone 6s</h3>
                                            <p>Explore iphone,the wrold most powerful personal device.check out iphone 6s</p>
                                            <p><a class="btn btn-sm btn-success" role="button">Buy Now</a></p>

                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="images/hamburger_vegetables_900x300.jpg" alt="image03" />
                                        <div class="carousel-caption">
                                            <h3>Beats HeadPhones</h3>
                                            <p>Shop headphones,earphones,speakers and accessories at eshop.com</p>
                                            <p><a class="btn btn-sm btn-success" role="button">Buy Now</a></p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <!-- carosule-->
                        </div>

                    </div>
                    <!--end of the carasoule-holder-->

                    <div class="row">
                        <!--start of the second row-->
                        <!--Search all Products-->
                        <div class="container">
                            <div class="row">
                                <div class="col-md-9 text-center">
                                    <h2 class="page-header">All Products
                                    </h2>
                                </div>

                            </div>
                        </div>
              <!-- end of the Search all Products-->
                        <!--getproduct-->

                        <div class="row" style="padding-top: 50px">
                            <asp:Repeater ID="rptrProducts" runat="server">
                                <ItemTemplate>
                                    <div class="col-sm-3 col-md-3">
                                        <a style="text-decoration: none;" href="ProductView.aspx?PID=<%#Eval("PID") %>">
                                            <div class="thumbnail">
                                                <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("ImageName") %>">
                                                <div class="caption">
                                                    <div class="probrand"><%#Eval("BrandName") %></div>
                                                    <div class="proName"><%#Eval("PName") %></div>
                                                    <div class="proPrice"><span class="proOgPrice"><%#Eval("PPrice") %></span> <%#Eval("PSelPrice") %> <span class="proPriceDiscount">(<%#Eval("DiscAmount") %>  Off)</span></div>
                                                    <div class="col-xs-11 margin-vert">
                                                        <a href="ProductView.aspx?PID=<%#Eval("PID") %>" class="form-control btn btn-default">ADD TO CART</a>
                                                    </div>
                                                </div>
                                                <div class="ratings">
                                                    <p class="pull-right">31 reviews</p>
                                                    <p>
                                                        <span class="glyphicon glyphicon-star"></span>
                                                        <span class="glyphicon glyphicon-star"></span>
                                                        <span class="glyphicon glyphicon-star"></span>
                                                        <span class="glyphicon glyphicon-star"></span>
                                                        <span class="glyphicon glyphicon-star-empty"></span>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <!--end of getALL Product--->
                        <!--
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4 class="pull-right">$74.99</h4>
                                <h4><a href="#">Third Product</a>
                                </h4>
                                <p>This is a short description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>-->
                    </div>
                    <!--end of the second row-->

                </div>
                <!--end of col-md-9-->

            </div>
            <!--endof the first row-->

        </div>
        <!-- /.container -->
 <!--recomended for you-->
         <!-- Page Content -->
    <div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="page-header">
                    Recomended For You
                  
                </h2>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
            <div class="col-md-4 portfolio-item">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x400" alt="">
                </a>
                <h3>
                    <a href="#">Project Name</a>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
        </div>
        <!-- /.row -->
<!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /end of container -->
<!--recomended for you-->
<!--Employee At our Team-->
 <!-- Page Content -->
    <div class="container">
<!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="page-header">Our Team</h2>
            </div>
            <asp:Repeater ID="rptrEmployeesDetails" runat="server">
                <ItemTemplate>
            <div class="col-lg-4 col-sm-6 text-center">
                <a href="#"><asp:Image ID="Image1" class="img-circle img-responsive img-center" runat="server" ImageUrl='<%#"data:image/png;base64,"+Convert.ToBase64String((byte[])Eval("ImageData")) %>' Height="100px" Width="100px" alt='<%#Eval("EmpName") %>' />

                <h3><%#Eval("EmpName") %>
                    <small><%#Eval("EmpType") %></small>
                </h3>
                <h5><small><%#Eval("Empspec") %></small></h5>
                <h5><small><%#Eval("EmpEmail") %></small></h5>
                <p><%#Eval("EmpDescription") %></p>
                </a>
            </div>
                </ItemTemplate>



            </asp:Repeater>
          
       
           
        </div>
</div>
    <!-- / end of the container -->
<!-- Employee AT our Team-->
<!-- Footer -->
        <hr />
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Location</h3>
                        <p>Santinager 34
                            <br>Kathmandu,Nepal</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="#"><span class="sr-only">Facebook</span><i class="fa  fa-facebook "></i></a>
                            </li>
                            <li>
                                <a href="#"><span class="sr-only">Google Plus</span><i class="fa  fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#"><span class="sr-only">Twitter</span><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><span class="sr-only">Linked In</span><i class="fa  fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#"><span class="sr-only">Dribble</span><i class="fa  fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Links</h3>
                        <p><a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Product</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; www.eshopNepal.com 2017
                    </div>
                </div>
            </div>
        </div>
    </footer>


       
   </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
