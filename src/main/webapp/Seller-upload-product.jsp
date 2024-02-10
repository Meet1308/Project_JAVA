<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="SellerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Add Product</title>
</head>
<body>
	<div class="container">
	<div class="col-sm-4">
					
					<div class="signup-form"><!--sign up form-->
						<h2><b>Seller Upload Products</b></h2>
						<form action="ProductController" method="post" enctype="multipart/form-data">
							<input type="hidden" name="sid" value="<%=s.getId()%>">
							<input type="file" name="image"/>
							<input type="text"  name="pname"  placeholder="Product Name"/>
							<input type="text"  name="pprice"  placeholder="Product Price"/>
							<input type="text"  name="pcategory"  placeholder="Product Category"/>
							<input type="text"  name="pdesc"  placeholder="Product Description"/>
							<button type="submit"  name="action"  value="upload" class="btn btn-default">Upload</button>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>