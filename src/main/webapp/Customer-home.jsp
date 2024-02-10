<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="CustomerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CUSTOMER HOME</title>
</head>
<body>
	
	<%
	 response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);	
	%>
	
	<% List<Product> list = ProductDao.getAllProducts();  %>
	<section>
		<div class="container">
		<h1><b>Welcome to home page</b></h1>
					<div class="col-sm-12 padding-right">
					
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<%for(Product p:list){ %>
						<div class="col-sm-4">
						
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="image/<%=p.getImage()%>" alt="" height="400px" width="400px"/>
											<h2><%=p.getPname() %></h2>
											<p>Rs.<%=p.getPprice() %></p>		
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="c-single-product.jsp?pid=<%=p.getPid()%>"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="c-single-product.jsp?pid=<%=p.getPid()%>" class="btn btn-sucess"><i class="fa fa-shopping-cart"></i>Add to Cart</a></li>
									</ul>
								</div>
							</div>
						</div>
					<% } %>
					</div><!--features_items-->
			
				
				</div>
			</div>
		
	</section>
</body>
</html>