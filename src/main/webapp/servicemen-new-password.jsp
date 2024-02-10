<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String email = (String)request.getAttribute("email"); %>
	<div class="container">
	<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><b>Change Password</b></h2>
						
						<form action="Sellercontroller" method="post">
						
							<input type="hidden" name="email" value=<%=email %> />
							New Password:
							<input type="password" name="np" placeholder="New Password"/>
							
							Confirm new Password:
							<input type="password" name="cnp" placeholder="Confirm New Password"/>
							
							<button type="submit"  name="action" value="new pass" class="btn btn-default">submit</button><br>
						</form>
					</div><!--/sign up form-->
					
	</div>
	</div>
</body>
</html>>