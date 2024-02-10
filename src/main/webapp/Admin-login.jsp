<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<body>
	<%
		String msg = (String)request.getAttribute("msg");
	%>
	<%
		String msg1 = (String)request.getAttribute("msg1");
	%>

	<div class="container">
	<% if(msg1 != null){%>
	<h4><b><% out.print(msg1); %></b></h4>
	<%} %>
	<% if(msg != null){%>
	<h4><b><% out.print(msg); %></b></h4>
	<%} %>
	<div class="col-sm-4">
					
					<div class="signup-form"><!--sign up form-->
						<h2><b>Admin Login</b></h2>
						<form action="AdminController" method="post">
							Email:
							<input type="email" name="email" placeholder="Email Address"/>
							Password:
							<input type="password"  name="password" placeholder="Password"/>
							<button type="submit"  name="action" value="login" class="btn btn-default">Login</button>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>