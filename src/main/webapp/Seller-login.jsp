<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Login</title>
</head>
<body>
	<%
		String msg3 = (String)request.getAttribute("msg3");
	%>
	<%
		String msg2 = (String)request.getAttribute("msg2");
	%>
	
	
	<div class="container">
	<% if(msg2 != null){%>
	<h4><b><% out.print(msg2); %></b></h4>
	<%} %>
	<% if(msg3 != null){%>
	<h4><b><% out.print(msg3); %></b></h4>
	<%} %>
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><b>Seller Login</b></h2>
						
						<form action="Sellercontroller" method="post">
							Email:
							<input type="email" name="email" placeholder="Email Address"/>
							Password:
							<input type="password"  name="password" placeholder="Password"/>
							<button type="submit"  name="action" value="login" class="btn btn-default">Login</button><br>
							<a class="btn btn-default" href="seller-forgot-password.jsp">Forgot Password ?</a>
						</form>
					</div><!--/sign up form-->
					
	</div>
	</div>
</body>
</html>