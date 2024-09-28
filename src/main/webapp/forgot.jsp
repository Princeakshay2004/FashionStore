<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot password</title>
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
 Message msg=(Message)session.getAttribute("proccedForgot");
 if(msg!=null)
 {
%>
 <div class="alert <%=msg.getType()%> text-center" role="alert"> <%=msg.getContent() %></div> 
<% 
 }
 session.removeAttribute("proccedForgot");
 %>
   <form action="/proccedForgot" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" class="form-control" required="required" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="mb-2 text-center">
  	   	  <a href="/login" class="btn btn-secondary mb-2">Back</a>
      <button type="submit" class="btn btn-success mb-2">Send</button>
      <br>
      <span>You Remember Your Password ? <a href="/login" style="text-decoration: none;">login</a></span>   
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