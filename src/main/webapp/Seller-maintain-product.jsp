<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "SellerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Product Image</td>
							<td class="description">Product Name</td>
							<td class="price">Product Price</td>
							<td class="quantity">Product Category</td>
							<td class="total">Product Description</td>
							<td>Edit</td>
							<td>Delete</td>
						</tr>
					</thead>
					<tbody>
						<%List<Product> list = ProductDao.getProductListBySid(s.getId());  %>
						<% for(Product p: list){ %>
						<tr>
							<td class="cart_product">
								<img src="image/<%=p.getImage() %>" alt="" style="width: 80px;">
							</td>
							<td class="cart_description">
								<h4><%=p.getPname() %></h4>
							</td>
							<td class="cart_description">
								<h4><%=p.getPprice() %></h4>
							</td>
							<td class="cart_description">			
								<h4><%=p.getPcategory() %></h4>
							</td>
							<td class="cart_description">
								<h4><%=p.getPdesc() %></h4>
							</td>
							<td>
								<a href="seller-single-product.jsp?id=<%=p.getPid() %>" class="btn btn-success">Edit</a> 
							</td>
							<td>
								<a href="seller-delete-product.jsp?id=<%=p.getPid() %>" class="btn btn-danger">Delete</a> 
							</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
</body>
</html>