<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
</head>
<body>
	<%
		String msg = (String)request.getAttribute("msg");
	%>
	<%
		String msg2 = (String)request.getAttribute("msg2");
	%>
	<%
		String msg3 = (String)request.getAttribute("msg3");
	%>
	<div class="container">
	<%if(msg != null) {  %>
	<h4><b><% out.print(msg);} %></b></h4>
	<%if(msg2 != null) {  %>
	<h4><b><% out.print(msg2);} %></b></h4>
	<%if(msg3 != null) {  %>
	<h4><b><% out.print(msg3);} %></b></h4>
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><b>Customer Login</b></h2>
						<form action="Customercontroller" method="post">
							Email:
							<input type="email" name="email" placeholder="Email Address"/>
							Password:
							<input type="password"  name="password" placeholder="Password"/>
							<button type="submit"  name="action" value="login" class="btn btn-default">Login</button><br>
							<a class="btn btn-default" href="customer-forgot-password.jsp">Forgot Password ?</a>
						</form>
					</div><!--/sign up form-->
	</div>
	</div>
</body>
</html>