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
<title>My Order's</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container" style="margin-top: 5em">
<a href="/" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<!-- Msg Model -->
	<%
	Message msg= (Message)session.getAttribute("myorder");
	if(msg!=null)
	{
	%>
	<div class="alert text-center <%=msg.getType()%>" role="alert"> <%=msg.getContent() %></div>
	<%	
		session.removeAttribute("myorder");
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
      <th scope="col" style="width: 350px">Title</th>
      <th scope="col" style="width: 150px">Date</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  	<%
   List<OrderDetail>orders=(List<OrderDetail>)session.getAttribute("orderdetail");
  	int no=0;
for(OrderDetail order:orders)
{
	no++;
%>

    <tr>
      <th scope="row"><%=order.getOid()%></th>
      <td><img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=order.getImage()%>.png" style="height: 100px;width: 100px;"></td>

      <td><%=order.getTitle()%></td>
      <td><%=order.getOrderDate().toLocaleString()%></td>
      <td><%=order.getQuentity()%></td>
      <td>₹ <%=order.getPrice()%></td>
      <td><%=order.getStatus()%></td>
      <%
      if(order.getStatus().equals("Order Cancelled"))
      {
    	%>
    	      <td><a  class="btn btn-danger disabled"  href="#">Cancel</a></td>
       	<%  
      }
      else{
    	  %>
    	 <td><a class="btn btn-danger" href="/order/cancel/<%=order.getOid()%>?uid=<%=user.getuId()%>">Cancel</a></td>
    	  <%
      }
      %> 
           
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