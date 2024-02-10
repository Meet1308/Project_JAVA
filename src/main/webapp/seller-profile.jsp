<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="SellerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h1><b>Seller Profile</b></h1>
						<form action="Sellercontroller" method="post">
							
							<input type="hidden" name="id" value="<%=s.getId()%>"/>
							Name:
							<input type="text" name="name" value="<%=s.getName()%>"/>
							Contact:
							<input type="text" name="contact" value="<%=s.getContact()%>"/>
							Address:
							<input type="text" name="address" value="<%=s.getAddress()%>"/>
							Email:
							<input type="text" name="email" value="<%=s.getEmail()%>"/>
							
							<button type="submit"  name="action" value="update" class="btn btn-default">Update</button>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>