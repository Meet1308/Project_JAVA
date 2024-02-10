<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>
</head>
<body>
	<%String email = (String)request.getAttribute("email"); %>
	<%int otp = (Integer)request.getAttribute("otp"); %>
	<div class="container">
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><b>OTP Verification</b></h2>
						
						<form action="Customercontroller" method="post">
						
							<input type="hidden" name="email" value=<%=email %> />
							<input type="hidden" name="otp1" value=<%=otp %> />
							OTP:
							<input type="text" name="otp2" placeholder="Enter OTP"/>
							<button type="submit"  name="action" value="verify" class="btn btn-default">Verify</button><br>
						</form>
					</div><!--/sign up form-->
					
	</div>
	</div>
</body>
</html>