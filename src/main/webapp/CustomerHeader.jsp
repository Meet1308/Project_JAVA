<%@page import="dao.CartDao"%>
<%@page import="model.Cart"%>
<%@page import="dao.WishListDao"%>
<%@page import="model.WishList"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">      
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<%  Customer c =  (Customer)session.getAttribute("customer"); %>
	
	<header id="header"><!--header-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<%List<WishList> wlist = WishListDao.getWishListByCusId(c.getId()); %>
										<li><a href="WishList.jsp"><i class="fa fa-crosshairs"></i><%out.print(wlist.size());%> Wishlist</a></li>
								<%List<Cart> clist = CartDao.getCartByCusid(c.getId()); %>		
									<li><a href="Cart.jsp"><i class="fa fa-shopping-cart"></i><%out.print(clist.size());%> Cart</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
				<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="Customer-home.jsp" class="active">Home</a></li>
                             <% if(c != null){ %>
                                <li class="dropdown"><a href="#"><%=c.getName() %><i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                   						<li><a href="customer-profile.jsp">Profile</a></li> 
                   						<li><a href="customer-change-password.jsp">Change Password</a></li> 
                   						<li><a href="index.jsp">Logout</a></li>
                                    </ul>
                             <% } %>
                                </li>  
                                <li><a href="customer-order-history.jsp" class="">Order-History</a></li>
                                 
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>