
<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<%@include file="addProductModal.jsp"%>
<div class="container" style="margin-top: 5em;">
	<div class="row">
	<!-- Msg Model -->
	<%
	Message msg= (Message)session.getAttribute("productMsg");
	if(msg!=null)
	{
	%>
	<div class="alert text-center <%=msg.getType()%>" role="alert"> <%=msg.getContent() %></div>
	<%	
		session.removeAttribute("productMsg");
	}
	%>

<!-- Msg End -->
			<div class="card col-md-3 m-5 mb-0 mt-0 shadow" data-bs-toggle="modal" data-bs-target="#exampleModal">
				<a  href="#"class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/plus.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">Add Product</p>
				</a>
			</div>
			<div class="card col-md-3 m-5 mb-0 mt-0 shadow">
				<a href="#" class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/list.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">Category</p>
				</a>
			</div>
			<div class="card col-md-3 m-5 mb-0 mt-0 shadow">
				<a href="/admin/listProducts" class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/products.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">List Product's</p>
				</a>
			</div>
			<div class="card col-md-3 m-5  mb-0 shadow">
				<a href="/admin/listOrders" class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/shopping-cart.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">Order's</p>
				</a>
			</div>
			<div class="card col-md-3 m-5  mb-0 shadow">
				<a href="/admin/listUsers" class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/team.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">User's</p>
				</a>
			</div>
			<div class="card col-md-3 m-5  mb-0 shadow">
				<a href="#" class="text-decoration-none text-dark">
					<div class="d-flex justify-content-center">
						<img class="m-3" src="/img/user.png"
							style="width: 200px; height: 200px">
					</div>
					<p class="text-center fw-bold">Admin</p>
				</a>
			</div>
		</div>
</div>



</body>
</html>