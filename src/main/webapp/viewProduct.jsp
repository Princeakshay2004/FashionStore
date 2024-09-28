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
<title>view Products</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="row col-md-12 mt-5">
<div class="card  me-0 shadow-lg rounded" style=" margin-left: 10px">
  <div class="card-body ms-3">
  
     <div class="row ">
     <%
     Message msg=(Message)session.getAttribute("cart");
     if(msg!=null)
     {
    %> 
  		 <div class="alert <%=msg.getType()%> text-center" role="alert"><%=msg.getContent()%></div>
    <%
     }
     session.removeAttribute("cart");
     %>
  
     <%--Products Listing  --%>  
     <% 
     Product product=(Product) session.getAttribute("productView");
    {
     %>
    
      <div class="card col-md-11 ms-5 mt-5 shadow d-flex" style="margin-bottom: 4em">
      
     <a href="#" class="text-decoration-none text-dark">
     <%--Image Div --%>
   	<div class="d-flex">
	<img class="m-3 card-img" src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=product.getpImage()%>.png"style="width: 400px; height: 500px;object-fit:contain; ">
	<div class="m-3">
    <p class="mt-1" style="font-size: 1.5rem ; font-weight:600"><%=product.getpTitle()%></p>
    <p><span style="font-size: 1rem ; font-weight:500">Description: </span> <%=product.getpDescription()%></p>
	 <%-- Div Offer  --%>
     <div class="d-flex mt-2">
     <div style="background-color: #C7253E ;width: 70px;border-radius: 5%;height: 30px">
     <p class="text-light m-1" style="font-weight: 600;font-size: 0.9rem"><%=product.getpDiscount()%>% off</p>
     </div>
     <div>
     <p class=" m-1 text-danger" style="font-weight: 700;font-size: 0.9rem">Limited Time Deal</p>
     </div>
     </div>
	  <%-- Prize deal --%>
     <div class="d-flex mt-2" style="height: 25px">
     <div>
     <p class=" fw-bold " style="font-size: 1.5rem">₹ <%=product.getDiscountedPrize()%>.00</p>
     </div>
     <div class="m-0">
     <p class="m-1" style="font-weight: 500;font-size: 0.9rem ;text-decoration: line-through;"> ₹<%=product.getpPrize()%>.00</p>
     </div>
     </div>
     <p class="mt-3">Size: S,M,L,XL </p>
      <%--Buy Div--%>
     <div class="d-flex mt-1" style="margin-top: 5em" >
     <div class="m-3">
     <img src="/img/money-stack.png" style="height: 50px; margin-left: 30px"></img>
     <p class="m-1" style="font-weight: 600;font-size: 1rem ;margin-top: 0em">CASH on Delivery</p> 
     </div>
     <div class="m-3">
     <img src="/img/return.png" style="height: 50px; margin-left: 30px"></img>
     <p class="m-1" style="font-weight: 600;font-size: 1rem ;">EASY Reaturn</p>
     </div>
     <div class="m-3">
     <img src="/img/fast-delivery.png" style="height: 50px; margin-left: 30px"></img>
     <p class="m-1" style="font-weight: 600;font-size: 1rem ;">FREE Delivery</p>
     </div>
     </div>
      <%--Buy Div--%>
     <div class="d-flex mt-1" style="margin-top: 5em" >
     <div class="m-3">
		<a class="btn btn-outline-success" href="/order?pid=<%=product.getPid()%>" style="width:30em"><i class="fa-solid fa-cart-shopping"></i> Buy Now</a>
     </div>
     </div>
	</div>
	</div>
    </a>
     </div>
    <%
    double total=product.getDiscountedPrize();
    session.setAttribute("total",total);
    } %>
     </div>
  </div>
</div>
</div>



</body>
</html>