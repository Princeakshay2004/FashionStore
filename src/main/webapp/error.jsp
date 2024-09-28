<%@page import="com.Helper.Message"%>
<%@page import="java.util.Collections"%>
<%@page import="com.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Something Went Wrong!</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div>
  

  <img alt="" src="/img/error.jpg" style="width: 100%;height: 45em;object-fit:cover;">
  <div class="card-img-overlay">
  <div class="d-flex justify-content-center" style="margin-top:30em">
<h5>Something went wrong!</h5>
    </div>
  <div class="d-flex justify-content-center" >
      <a href="/" class="btn btn-outline-success">Go To HomePage</a>
    </div>
   
  </div>

  
  

</div>
</body>
</html>