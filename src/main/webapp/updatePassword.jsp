<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>
<%@include file="base.jsp"%>
</head>
<%@include file="navbar.jsp"%>
<body style="margin-top:2em">
<div class="card col-md-12">
<img alt="" src="img/homepage-cover.jpg" style="width: 100%;height: 43.5em ;object-fit:fill;">
  <div class="card-img-overlay">
   <div class="container mt-5">
   
<div class="row">
<div class="col-md-4 offset-md-8 mt-5">
<div class="card bg-transparent shadow-lg p-3 rounded">
 <div class="card-body">
  <h4 class="text-center fw-bold">Reset Password</h4>
 <%
 String Token=(String)session.getAttribute("Token");
 Message msg=(Message)session.getAttribute("updatePassword");
 if(msg!=null)
 {
%>
 <div class="alert <%=msg.getType()%> text-center" role="alert"> <%=msg.getContent() %></div> 
<% 
 }
 session.removeAttribute("updatePassword");
 %>
   <form action="/updatePassword" method="post">
    <input type="hidden" value="<%=Token%>" name="Token">
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">New Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Conform Password</label>
    <input type="password" name="conform_password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3 text-center">
 	  <a href="/forgot" class="btn btn-secondary mb-2">Back</a>
      <button type="submit" class="btn btn-success mb-2">update Password</button>
      <br>
  </div>
</form>
  </div>
</div>
</div>
</div>
</div>
  </div>
</div>
</body>
</html>