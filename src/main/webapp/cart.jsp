<%@page import="com.ServiceImpl.cartServiceImpl"%>
<%@page import="com.Repo.cartRepo"%>
<%@page import="com.Entity.Cart"%>
<%@page import="com.Helper.Message"%>
<%@page import="com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Cart</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container" style="margin-top: 5em">
<a href="/products/list" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<%
Message msg=(Message)session.getAttribute("productoperation");
if(msg != null)
{
%>
<div class="alert <%=msg.getType()%> text-center fw-bold" role="alert"><%=msg.getContent()%></div>
<%	
}
session.removeAttribute("productoperation");
%>
<div class="card">
<div class="card-body">
<h4 class="text-center">List of all Products</h4>
<hr>
<table class="table ">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Image</th>
      <th scope="col">Title</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
    </tr>
  </thead>
  <tbody>
  	<%
List<Cart>carts=(List<Cart>)session.getAttribute("CartList");
  	int no=0;
  	double total=0.0f;
for(Cart cart:carts)
{
	no++;
	 total=total+(cart.getTotal()*cart.getQuantity());
	 session.setAttribute("total", total);
%>
    <tr>
      <th scope="row"><%=no%></th>
      <td>
      <img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=cart.getProduct().getpImage()%>.png" style="height: 50px;width: 50px;"></td>
      <td style="width: 300px"><%=cart.getProduct().get10Words(cart.getProduct().getpTitle())%></td>
      <td><%=cart.getProduct().getDiscountedPrize()%>.00</td>
      <td>
      <a href="/cart/update/minus?uid=<%=user.getuId()%>&pid=<%=cart.getId()%>"><i class="fa-solid fa-minus text-danger"></i></a>
          [ <%=cart.getQuantity()%> ]   
           <a href="/cart/update/plus?uid=<%=user.getuId()%>&pid=<%=cart.getId()%>"><i class="fa-solid fa-plus text-success"></i></a>
      </td>
      <td>₹ <%=cart.getTotal()*cart.getQuantity()%></td>
    </tr>    
    <%} %>
  </tbody>
   <tr>
     <th colspan="4"></th>
     <th>Total :</th>
     <td>₹<%=total%></td>
 </table>
 <div class="d-flex justify-content-center">
<a href="/order" class="btn btn-success"><i class="fa-solid fa-credit-card"></i> Procced To Payment </a>
</div>
</div>
</div>
</div>
</body>
</html>