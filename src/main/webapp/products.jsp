<%@page import="com.Helper.Message"%>
<%@page import="java.util.Collections"%>
<%@page import="com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="row col-md-12 mt-5">
<div class="card  me-0 shadow-lg rounded" style=" margin-left: 10px">
  <div class="card-body ms-3">
  
     <div class="row ">
     <%--Products Listing  --%>  
     <% 
     Message msg=(Message)session.getAttribute("Products");
     if(msg!=null)
     {
     %>
     <div class="alert <%=msg.getType()%> text-center fw-bold" role="alert"><%=msg.getContent()%> </div>
     <%
     }
     session.removeAttribute("Products");     
    List<Product>products=(List<Product>)session.getAttribute("ProductList");
     Collections.shuffle(products);
     	for(Product product:products)
    	 {
    	 %>
      <div class="card col-md-2 m-4 shadow">
     <a href="/products/productView/<%=product.getPid()%>" class="text-decoration-none text-dark">
     <%--Image Div --%>
   	<div class="d-flex justify-content-center">
	<img class="m-3 card-img" src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=product.getpImage()%>.png"style="width: 210px; height: 200px;object-fit:contain; ">
	</div>
	<hr style="margin: 0em">
     <p class="m-0" style="font-size: 0.9rem ; font-weight: 600"><%=product.get10Words(product.getpTitle())%></p>
     <%-- Div Offer  --%>
     <div class="d-flex">
     <div style="background-color: #C7253E ;width: 60px;border-radius: 7%;height: 25px">
     <p class="text-light m-1" style="font-weight: 600;font-size: 0.7rem"><%=product.getpDiscount()%>% off</p>
     </div>
     <div>
     <p class=" m-1 text-danger" style="font-weight: 700;font-size: 0.8rem">Limited Time Deal</p>
     </div>
     </div>
     <%-- Prize deal --%>
     <div class="d-flex" style="height: 25px">
     <div>
     <p class=" fw-bold">₹ <%=product.getDiscountedPrize()%>.00</p>
     </div>
     <div class="m-0">
     <p class="m-1" style="font-weight: 500;font-size: 0.8rem ;text-decoration: line-through;"> ₹<%=product.getpPrize()%>.00</p>
     </div>
     </div>
     <p class="m-0">Size: M,L,XL,S </p>
     <%--Buy Div--%>
     <div class="d-flex" >
     <div>
     <p class="m-1" style="font-weight: 600;font-size: 0.8rem ;">FREE Delivery</p>
     </div>
     <div>
     <a href="/cart/add?uid=<%=user.getuId()%>&pid=<%=product.getPid() %>" class="btn btn-outline-warning btn-sm mb-2 ms-4" style="font-weight: 600;font-size: 0.8rem ;">Add to Cart</a>
    
     </div>
     </div>
     </a>
     </div>
    <%} %>
     </div>
  </div>
</div>
</div>
</body>
</html>