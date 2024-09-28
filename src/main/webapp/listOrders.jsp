<%@page import="com.Entity.OrderDetail"%>
<%@page import="com.Helper.Message"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order's List</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container" style="margin-top: 5em">
<a href="/admin" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<!-- Msg Model -->
	<%
	Message msg= (Message)session.getAttribute("orderStatus");
	if(msg!=null)
	{
	%>
	<div class="alert text-center <%=msg.getType()%>" role="alert"> <%=msg.getContent() %></div>
	<%	
		session.removeAttribute("orderStatus");
	}
	%>

<!-- Msg End -->
<div class="card">
<div class="card-body">
<h4 class="text-center">List of Your Order's</h4>
<hr>
<table class="table ">
  <thead>
    <tr>
      <th scope="col"  style="width: 200px">Order Id</th>
      <th scope="col">Image</th>
      <th scope="col" style="width: 200px">Title</th>
      <th scope="col" style="width: 150px">Date</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  	<%
   List<OrderDetail>orders=(List<OrderDetail>)session.getAttribute("OrdersList");
  	int no=0;
for(OrderDetail order:orders)
{
	no++;
%>
    <tr>
    <form action="/admin/updateSatus/<%=order.getOid()%>" method="post">
      <th><%=order.getOid()%><br>Email:<%=order.getEmail() %></th>
      <td><img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=order.getImage()%>.png" style="height: 100px;width: 100px;"></td>

      <td><%=order.get10Words(order.getTitle())%></td>
      <td><%=order.getOrderDate().toLocaleString()%></td>
      <td><%=order.getQuentity()%></td>
      <td>₹ <%=order.getPrice()%></td>
      <td><%=order.getStatus()%>
      
       <select id="inputState"name="orderStatus" class="form-select" required="required">
        <option selected="selected" disabled="disabled">--Select--</option>
        <option>In Progress</option>
		<option>Out For Delivery</option>
		<option>Order Delivered</option>
		<option>Order Cancelled</option>
		</select>
      </td>
      <td><button type="submit" class="btn btn-success">Update</button></td>
   </form>
    </tr>    
    <%} %>
  </tbody>
   
 </table>
 <div class="d-flex justify-content-center">
</div>
</div>
</div>
</div>
</body>
</html>