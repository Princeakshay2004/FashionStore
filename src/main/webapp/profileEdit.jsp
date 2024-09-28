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
<title>Profile Edit</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container col-md-12" style="margin-top: 5em">
<a href="/" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>
<%--Message --%>
   <%Message msg=(Message)session.getAttribute("signupMsg");
   	if(msg!=null)
   	{
    %>
    <div class="alert text-center fw-bold <%=msg.getType()%>" role="alert"> <%=msg.getContent() %></div>
    <%} 
    session.removeAttribute("signupMsg");%>
    <%--Message End --%>
     <%--Card Start --%>
	<div class="card shadow-lg rounded">
  <div class="card-body">
   
  <div class="d-flex justify-content-center">
  <img class="m-3 card-img" src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=user.getProfile()%>.png"style="width: 100px; height: 100px; border-radius:50%;object-fit:cover; ">
  </div>
   	<h5 class="text-center fw-bold"><%=user.getName()%></h5>
   	<p class="text-center" ><%=user1.getEmail()%></p>
	<hr>
   <form class="row g-3" action="/saveProfile/<%=user.getuId()%>" method="post" enctype="multipart/form-data">
  <div class="col-md-4">
    <label for="name" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" required="required" id="name" aria-describedby="name" value="<%=user.getName()%>">
  </div>
  <div class="col-md-4">
    <label for="number" class="form-label">Mobile No</label>
    <input type="text" name="mobile" required="required" class="form-control" id="mobile" aria-describedby="mobile" value="<%=user.getMobile()%>">
  </div>
   <div class="col-md-4">
    <label for="email" class="form-label">Email address</label>
    <input disabled="disabled" name="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getEmail()%>">
  </div>
   
  	<div class="col-md-4">
    <label for="inputAddress2" class="form-label">Address</label>
    <input type="text" value="<%=user.getAddress()%>" name="address" required="required" class="form-control" id="inputAddress">
  </div>
  <div class="col-md-2">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" name="city" value="<%=user.getCity()%>" required="required" class="form-control" id="inputCity">
  </div>
  <div class="col-md-2">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState"name="state"  class="form-select" required="required">
        <option selected="selected"  value="<%=user.getState()%>"><%=user.getState()%></option>
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
  <div class="col-md-2">
    <label for="pincode" class="form-label">pincode</label>
    <input type="text" value="<%=user.getPincode()%>" name="pincode" class="form-control" id="pincode" required="required">
  </div>
  <div class=" col-md-2">
    <label for="address" class="form-label">Gender : </label>
    <br>
  	<input class="form-check-input"  type="radio" name="gender" id="inlineRadio1" value="male"> Male
  	<input class="form-check-input"  type="radio" name="gender" id="inlineRadio2" value="female"> Female
  	</div>
	 <div class="col-md-4">
	   <label for="exampleInputPassword1" class="form-label">Profile</label>
	<input type="file" name="profile"  class="form-control" id="profile" value="<%=user.getProfile()%>">
	<%=user.getProfile()%>
  </div>
  <div class="col-md-4">
    <label for="exampleInputPassword1" class="form-label">Old Password</label>
    <input type="password" name="password"  class="form-control" id="exampleInputPassword1" placeholder="Enter Old Password">
  </div>
  <div class="col-md-4">
    <label for="exampleInputPassword1" class="form-label">New Password</label>
    <input type="password" name="newpassword"  class="form-control" id="exampleInputPassword1" placeholder="Enter New Password">
  </div>
  <div class="mb-1 text-center">
  	  <button type="reset" class="btn btn-danger">Reset</button>
      <button type="submit" class="btn btn-success">Submit</button>
  </div>
</form>
</div>
</div>
  </div>
</body>
</html>


