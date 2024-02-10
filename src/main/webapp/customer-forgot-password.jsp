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
	<div class="col-sm-5">
					<div class="signup-form"><!--sign up form-->
						<h1><b>Customer Forgot Password</b></h1>
						
						<form action="Customercontroller" method="post">
							Your Email:
							<input type="email" name="email" placeholder="Email Address"/>
							<button type="submit"  name="action" value="get otp" class="btn btn-default">GET OTP</button>
						</form>
					</div><!--/sign up form-->		
	</div>
	</div>
</body>
</html>