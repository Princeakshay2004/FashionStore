<%@page import="com.Helper.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>

<div class="container" style="margin-top: 6em">
<div class="card shadow">
<div class="card-body mb-5">
<%

double total=(double)session.getAttribute("total");
String pid=request.getParameter("pid");
%>
<form class="" action="/order/saveOrder/<%=user.getuId()%>?pid=<%=pid%>" method="post" >
<div class="d-flex col-md-12">
<%--Order Address Form --%>
 <div class="col-md-6 row g-3">
 <h4 class="text-center">Order Address</h4>
 <hr>
    <div class="col-md-6">
    <label for="name" class="form-label">First Name</label>
    <input type="text" name="firstname" class="form-control" required="required" id="name" aria-describedby="name">
  </div>
  <div class="col-md-6">
    <label for="name" class="form-label">Last Name</label>
    <input type="text" name="lastname" class="form-control" required="required" id="name" aria-describedby="name">
  </div>
  <div class="col-md-6">
    <label for="number" class="form-label">Mobile No</label>
    <input type="text" name="mobileno" required="required" class="form-control" id="mobile" aria-describedby="mobile">
  </div>
   <div class="col-md-6">
    <label for="email" class="form-label">Email address</label>
    <input type="email" name="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
<div class="col-md-6">
    <label for="inputAddress2" class="form-label">Address</label>
    <input type="text" name="address" required="required" class="form-control" id="inputAddress">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" name="city" required="required" class="form-control" id="inputCity">
  </div>
  <div class="col-md-6">
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
  <div class="col-md-6">
    <label for="pincode" class="form-label">pincode</label>
    <input type="text" name="pincode" class="form-control" id="pincode" required="required">
  </div>
  

</div>
<%--Order Payment Form --%>

<div class="col-md-5 ms-5">
<h4 class="text-center">Payment Type</h4>
 <hr>
    <table class="table table-borderless">
  <tbody >
    <tr>
      <td>Price</td>
      <td>:</td>
      <td>₹ <%=total%></td>
    </tr>
     <tr>
      <td>Delivery Fees</td>
      <td>:</td>
      <td><p class=" m-1 text-danger" style="font-weight: 700;font-size: 0.9rem">FREE Delivery</p></td>
    </tr>
    <tr>
      <td>Tax</td>
      <td>:</td>
      <%double tax =(total*6)/100;%>
      <td>₹ <%=tax %></td>
    </tr>
    <tr class="border-top">
      <td>Total Price</td>
      <td>:</td>
      <% double Totalprice=total+tax;%>
      <td>₹ <%=Totalprice%></td>
    </tr>
  </tbody>
  	
</table>
<input type="hidden" value="<%=Totalprice%>" name="Totalprice">

 
<div class="card">
  <div class="card-body">
  <div>
    <h5 class="text-center mb-5">Select payment Type</h5>
	<div class="fw-bold mt-2">
  	<input class="form-check-input ms-3" required="required" type="radio" name="paymentType" id="inlineRadio1" value="Cash on Delivery"> Cash on Delivery
  	<input class="form-check-input ms-5" required="required" type="radio" name="paymentType" id="inlineRadio2" value="Online Payment" data-bs-toggle="modal" data-bs-target="#exampleModal"> Online Payment
  	</div> 
		 
		 
  </div>
  <div class="text-center">
    <button type="submit" class="btn btn-success mt-4 shadow">Place Order</button>
  </div>
  </div>
</div>
</div>
 <%--Order Payment Form End --%>
 </div>
 
 <!--Add Product Modal -->
<div class="modal fade bd-example-modal-sm" style="margin-top: 6em" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm ">
   <div class="modal-content">
			<div class="modal-body">
				
					<p class="text-center" style="font-weight:650;font-size: 1.3rem "><img src="/img/icon.png" class="mb-1" style="height: 20px;width: 20px"/> FashionStore</p>
					<p class="text-center" style="font-size: 0.9rem ; font-weight: 600">Scan & PAY Here : ₹ <%=Totalprice%></p>
					
					<div class="d-flex justify-content-center">
						<img src="/img/paymentScanner.jpg" style="height: 12em;width: 12em;object-fit:contain;">
					</div>
					
				  <hr>
				 <div class="mb-1 text-center">
			       <button type="button" class="btn btn-success" data-bs-dismiss="modal"><i class="fa-solid fa-circle-check"></i> Complated</button>
				  </div>
				 
			</div>
		</div>
  </div>
</div> 
 <!--Add Product Modal End-->

</form>
</div>
</div>
 
</div>


  



</body>
</html>
