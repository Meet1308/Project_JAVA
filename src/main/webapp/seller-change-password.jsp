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
	<%String msg4 = (String)request.getAttribute("msg4"); %>
	<% if(msg4 != null){ %>
	<h1><b><%out.print(msg4); }%></b></h1>
	
	<%String msg5 = (String)request.getAttribute("msg5"); %>
	<% if(msg5 != null){ %>
	<h1><b><%out.print(msg5); }%></b></h1>
	<div class="col-sm-5">
	<div class="signup-form"><!--sign up form-->
						<h1><b>Seller Password Change</b></h1>
						<form action="Sellercontroller" method="post">
							
							<input type="hidden" name="id" value="<%=s.getId()%>"/>
							
							<input type="text" name="op"   placeholder="Old Password"/>
							
							<input type="password" name="np"  placeholder="New Password"/>
						
							<input type="password" name="cnp"  placeholder="Confirm New Password"/>
							
							<button type="submit"  name="action" value="change-password" class="btn btn-default">Change Password</button>
						</form>
	</div><!--/sign up form-->
	</div>
	</div> 
</body>
</html>