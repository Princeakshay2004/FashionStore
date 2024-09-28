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
<title>Users List</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container" style="margin-top: 5em">
<a href="/admin" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<%
Message msg=(Message)session.getAttribute("statusMsg");
if(msg != null)
{
%>
<div class="alert <%=msg.getType()%> text-center fw-bold" role="alert"><%=msg.getContent()%></div>
<%	
}
session.removeAttribute("statusMsg");
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
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Mobile</th>
      <th scope="col">Address</th>
       <th scope="col">City</th>
      <th scope="col">State</th>
      <th scope="col">Role</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  	<%
List<User>users=(List<User>)session.getAttribute("UserList");
  	int no=0;
for(User user2:users)
{
	no++;
%>
	
    <tr>
      <th scope="row"><%=no%></th>
      <td>
      <img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=user2.getProfile()%>.png" style="height: 40px;width: 40px;border-radius: 50%"></td>
      <td ><%=user2.getName()%></td>
      <td><%=user2.getEmail()%></td>
      <td><%=user2.getMobile()%></td>
      <td><%=user2.getAddress()%></td>
      <td><%=user2.getCity()%>,<%=user2.getPincode()%></td>
       <td><%=user2.getState()%></td>
      <td><%=user2.getRole()%></td>
      <td><%=user2.isEnabled()%></td>
      
      <td>
      	<a class="btn btn-sm btn-primary" href="/admin/updateStatus/<%=user2.getuId()%>/true" >Enable</a>
      	<a class="btn btn-sm btn-danger" href="/admin/updateStatus/<%=user2.getuId()%>/false">Disable</a>
      </td>
    </tr>
    <%} %>
  </tbody>
</table>
</div>

</div>
</div>
</body>
</html>