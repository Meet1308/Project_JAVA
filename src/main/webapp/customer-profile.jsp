<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="CustomerHeader.jsp" %>
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
						<h1><b>Customer Profile</b></h1>
						<form action="Customercontroller" method="post">
							
							<input type="hidden" name="id" value="<%=c.getId()%>"/>
							Name:
							<input type="text" name="name" value="<%=c.getName()%>"/>
							Contact:
							<input type="text" name="contact" value="<%=c.getContact()%>"/>
							Address:
							<input type="text" name="address" value="<%=c.getAddress()%>"/>
							Email:
							<input type="email" name="email" value="<%=c.getEmail()%>"/>
							
							<button type="submit"  name="action" value="update" class="btn btn-default">Update</button>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>