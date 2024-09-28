<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@include file="base.jsp"%>
</head>
<%@include file="navbar.jsp"%>

<body style="margin-top:2em">
<div class="card col-md-12">
<img alt="" src="img/homepage-cover.jpg" style="width: 100%;height: 43.5em ;object-fit:fill;">
 <div class="card-img-overlay">

<div class="container mt-2">
<div class="row">
<div class="col-md-6 offset-md-6 mt-3">
<%--card Start Here --%>
<div class="card bg-transparent bg-gradient shadow-lg  rounded">
  <div class="card-body">
   <%--Message --%>
   <%Message msg=(Message)session.getAttribute("signupMsg");
   	if(msg!=null)
   	{
    %>
    <div class=" text-center fw-bold <%=msg.getType()%>" role="alert"> <%=msg.getContent() %></div>
    <%} 
    session.removeAttribute("signupMsg");%>
    <%--Message End --%>
  <h4 class="text-center fw-bold">Sign Up</h4>

   <form class="row g-3" action="/saveUser" method="post" enctype="multipart/form-data">
    <div class="col-md-6">
    <label for="name" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" required="required" id="name" aria-describedby="name">
  </div>
  <div class="col-md-6">
    <label for="number" class="form-label">Mobile No</label>
    <input type="text" name="mobile" required="required" class="form-control" id="mobile" aria-describedby="mobile">
  </div>
   <div class="col-md-6">
    <label for="email" class="form-label">Email address</label>
    <input type="email" name="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class=" col-md-6">
  <label for="profile" class="form-label">Profile</label>
  <input type="file" name="profile" class="form-control" id="profile">
</div>
   <div>
    <label for="address" class="form-label">Gender : </label>
  	<input class="form-check-input" required="required" type="radio" name="gender" id="inlineRadio1" value="male"> Male
  	<input class="form-check-input" required="required" type="radio" name="gender" id="inlineRadio2" value="female"> Female</div>
  <div class="col-md-6">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" required="required" class="form-control" id="password">
  </div>
  <div class="col-md-6">
    <label for="exampleInputPassword1" class="form-label">Conform Password</label>
    <input type="password" name="conform_password" required="required" class="form-control" id="conform_password">
  </div>
  
<div class="col-12">
    <label for="inputAddress2" class="form-label">Address</label>
    <input type="text" name="address" required="required" class="form-control" id="inputAddress">
  </div>
  <div class="col-md-4">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" name="city" required="required" class="form-control" id="inputCity">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState"name="state" class="form-select" required="required">
        <option selected="selected" disabled="disabled">Choose...</option>
        <option>Andhra Pradesh</option>
		<option>Arunachal Pradesh</option>
		<option>Assam</option>
		<option>Bihar</option>
		<option>Chhattisgarh</option>
		<option>Goa</option>
		<option>Gujarat</option>
		<option>Haryana</option>
		<option>Himachal Pradesh</option>
		<option>Jharkhand</option>
		<option>Karnataka</option>
		<option>Kerala</option>
		<option>Maharashtra</option>
		<option>Madhya Pradesh</option>
		<option>Manipur</option>
		<option>Meghalaya</option>
		<option>Mizoram</option>
		<option>Nagaland</option>
		<option>Odisha</option>
		<option>Punjab</option>
		<option>Rajasthan</option>
		<option>Sikkim</option>
		<option>Tamil Nadu</option>
		<option>Tripura</option>
		<option>Telangana</option>
		<option>Uttar Pradesh</option>
		<option>Uttarakhand</option>
		<option>West Bengal</option>
		<option>Andaman & Nicobar (UT)</option>
		<option>Chandigarh (UT)</option>
		<option>Dadra & Nagar Haveli and Daman & Diu (UT)</option>
		<option>Delhi [National Capital Territory (NCT)]</option>
		<option>Jammu & Kashmir (UT)</option>
		<option>Ladakh (UT)</option>
		<option>Lakshadweep (UT)</option>
		<option>Puducherry (UT)</option>
    </select>
  </div>
  <div class="col-md-4">
    <label for="pincode" class="form-label">pincode</label>
    <input type="text" name="pincode" class="form-control" id="pincode" required="required">
  </div>
  <div class="mb-1 text-center">
  	  <button type="reset" class="btn btn-danger">Reset</button>
      <button type="submit" class="btn btn-success">Submit</button>
      <p class="pt-1">If you have an account ? <a href="/login" style="text-decoration: none;"> Sign In</a></P>   
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