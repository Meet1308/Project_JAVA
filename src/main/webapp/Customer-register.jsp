<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
</head>
<body>
	<%
		String msg1 = (String)request.getAttribute("msg1");
	%>
	<div class="container">
	<%if(msg1 != null) {  %>
	<h4><b><% out.print(msg1);} %></b></h4>
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><b>Customer Registration</b></h2>
						<form action="Customercontroller" method="post">
							Name:
							<input type="text" name="name" placeholder="Name"/>
							Contact:
							<input type="text" name="contact" placeholder="Mobile number"/>
							Address:
							<input type="text" name="address" placeholder="Address"/>
							Email:
							<input type="email" name="email" placeholder="Email Address"/>
							Password:
							<input type="password"  name="password" placeholder="Password"/>
							<button type="submit"  name="action" value="register" class="btn btn-default">Register</button>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>