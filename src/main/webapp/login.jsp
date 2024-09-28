<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
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
  <h4 class="text-center fw-bold">Login</h4>
 
 <%
 Message msg=(Message)session.getAttribute("Login");
 if(msg!=null)
 {
%>
 <div class="alert <%=msg.getType()%> text-center" role="alert"> <%=msg.getContent() %></div> 
<% 
 }
 session.removeAttribute("Login");
 %>
   <form action="/do_login" method="post">
  <div class="mb-2">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" required="required" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3 text-center">
      <button type="submit" class="btn btn-success mb-2">Sign In</button>
      <br>
      <span>Forgot Password <a href="/forgot" style="text-decoration: none;">reset password</a></span>   
      <p>Don't have an account yet? <a href="/signup" style="text-decoration: none;"> Create Account</a></P>   
  </div>
  <hr>
  <div class="mb-3 text-center">
  <a class="btn btn-light me-1" href="/oauth2/authorization/google"><img src="/img/google.png" style="width: 20px"> Google</a>
  <a class="btn btn-light me-1" href="/oauth2/authorization/facebook"><img src="/img/facebook.png" style="width: 20px"> Facebook</a>
  <a class="btn btn-light me-1" href="/oauth2/authorization/github"><img src="/img/github.png" style="width: 20px"> Github</a>
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