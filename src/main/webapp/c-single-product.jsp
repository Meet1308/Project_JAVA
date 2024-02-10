<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="CustomerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%int id = Integer.parseInt(request.getParameter("pid")); %>
	<%Product p = ProductDao.getProductByPid(id); %>
	<div class="container">
	<div class="col-sm-4">
					
					<div class="signup-form"><!--sign up form-->
						<h1><b>Product Details</b></h1><br>
						<form action="ProductController" method="post" enctype="multipart/form-data">
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<div style="display:flex;width:80vw;">
								<div style="width:50%;">
									<img style="width:70%" src="image/<%=p.getImage()%>" style="width: 300px;height: 300px;margin-left: 20px;"><br><br>
								</div>
								<div style="width:100%;">
									<input style="width:70%;" type="text"  name="pname"  placeholder="Product Name" value="<%=p.getPname()%>"/>
									<input style="width:70%;" type="text"  name="pprice"  placeholder="Product Price" value="<%=p.getPprice()%>"/>
									<input style="width:70%;" type="text"  name="pcategory"  placeholder="Product Category" value="<%=p.getPcategory()%>"/>
									<input style="width:70%;" type="text"  name="pdesc"  placeholder="Product Description" value="<%=p.getPdesc()%>"/>		
									<% 
										boolean flag = WishListDao.checkProduct(id, c.getId());
										if(flag){
										
									%>
											<a href="WishlistController?action=addtowishlist&pid=<%=p.getPid()%>&cid=<%=c.getId()%>"><i class="fa fa-plus-square"></i>Add to wishlist</a><br><br>
									<% } %>		
									
									<% 
										boolean bool = CartDao.checkProductInCart(p.getPid(), c.getId());
										if(bool == false){ %>	
										<a href="CartController?action=addtocart&pid=<%=p.getPid()%>&cid=<%=c.getId()%>"><i class="fa fa-plus-square"></i>Add to Cart</a>
									<% } %>
								</div>
							</div>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>