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
<title>Product Action</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container col-md-6" style="margin-top: 5em">
<a href="/admin/listProducts" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<%
Message msg=(Message)session.getAttribute("productoperation");
Product product=(Product)session.getAttribute("product");
if(msg != null)
{
%>
<div class="alert <%=msg.getType()%> text-center fw-bold" role="alert"><%=msg.getContent()%></div>
<%	
}
session.removeAttribute("productoperation");
%>
<div class="card shadow">
<div class="card-header navbarbg">
<h4 class="text-center">Edit Products</h4>
</div>
<div class="card-body">
       	<form class="row" action="/admin/updateProduct/<%=product.getPid()%>" method="post" enctype="multipart/form-data">
       		  <div class="form-group mb-2">
			    <label for="title">Product Name</label>
			    <input name="productName" type="text"  class="form-control" id="productName"  value="<%=product.getpTitle()%>">
			  </div>
			  <div class="d-flex">
			   <div class="form-group col-md-3 m-1">
			    <label for="title"> Quantity</label>
			    <input name="productQuantity" type="text" class="form-control" id="categoryTitle"  value="<%=product.getpQuantity() %>" >
			  </div>
			  
			  <div class="form-group col-md-4 m-1">
			    <label for="title"> Prize</label>
			    <input name="productPrize" type="text" class="form-control" id="categoryTitle" value="<%=product.getpPrize() %>" >
			  </div>
			  <div class="form-group col-md-4 m-1">
			    <label for="title"> Discount</label>
			    <input name="productDiscount" type="text" class="form-control" id="categoryTitle" value="<%=product.getpDiscount()%>"  >
			
			  </div>
			  </div>
			   
			 
			  <div class="form-group mb-2">
		    	<label for="title">Product Category</label>
				<select id="category" name="productCategory" class="form-select" required="required">
       			    <option selected="selected" value="<%=product.getpCategory()%>"><%=product.getpCategory()%></option>
			        <option value="Men">Men</option>
			        <option value="Women">Women</option>
			        <option value="Boy">Boy</option>
			        <option value="Girl">Girl</option>
			        <option value="Traditional">Traditional</option>
				</select>					  
				</div>	
			  
			  <div class="form-group mb-3">
			    <label for="text">ProductDescription</label>
			    <textarea rows="3" name="productDescription" class="form-control " id="categoryDescription"><%=product.getpDescription() %></textarea>
			  </div>
			  <div class="d-flex">
			   <div class="form-group mb-2">
      			<img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=product.getpImage() %>.png" style="height: 150px;width: 150px;"></td>
			  </div>
			  <div class="form-group mb-2 ms-4 col-md-8">
			    <label for="title">Product Image</label>
			    <input name="productImage" type="file" class="form-control" id="categoryTitle" value="<%=product.getpImage()%>">
			    <%=product.getpImage()%>
			  </div>
			  </div>
			  		  
			  <div class="d-flex justify-content-center mt-3">
       			<button type="reset" class="btn btn-danger me-2">Reset</button>
        		<button type="submit" class="btn btn-success ms-2 ">Update Product</button>
        		</div>
       	</form>
      </div>     
    </div>
  </div>
</body>
</html>

