<%@page import="dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int cart_id = Integer.parseInt(request.getParameter("cart_id")); 
		CartDao.removeItemFromCart(cart_id);
		response.sendRedirect("Cart.jsp");
	%>
</body>
</html>