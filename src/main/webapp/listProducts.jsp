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
<title>Product List</title>
</head>
<%@include file="base.jsp" %>
<body>
<%@include file="navbar.jsp" %>
<div class="container" style="margin-top: 5em">
<a href="/admin" class="nav-link m-2"><i class="fa-solid fa-reply"></i> Back</a>

<%
Message msg=(Message)session.getAttribute("productoperation");
if(msg != null)
{
%>
<div class="alert <%=msg.getType()%> text-center fw-bold" role="alert"><%=msg.getContent()%></div>
<%	
}
session.removeAttribute("productoperation");
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
      <th scope="col">Title</th>
      <th scope="col">Category</th>
      <th scope="col">Prize</th>
      <th scope="col">Discount</th>
      <th scope="col">Selling Prize</th>
      <th scope="col">Stock</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  	<%
List<Product>products=(List<Product>)session.getAttribute("ProductList");
  	int no=0;
for(Product product:products)
{
	no++;
%>
	
    <tr>
      <th scope="row"><%=no%></th>
      <td>
      <img src="https://res.cloudinary.com/dqg87xvqe/image/upload/v1725644115/<%=product.getpImage() %>.png" style="height: 50px;width: 50px;"></td>
      <td style="width: 300px"><%=product.get10Words(product.getpTitle())%></td>
      <td><%=product.getpCategory()%></td>
      <td><%=product.getpPrize()%>.00</td>
      <td><%=product.getpDiscount()%> %</td>
       <td><%=product.getDiscountedPrize()%>.00</td>
      <td><%=product.getpQuantity()%></td>
      <td>
      	<a class="btn btn-sm btn-primary" href="/admin/editProduct/<%=product.getPid()%>" ><i class="fa-solid fa-pen-to-square"></i> Edit</a>
      	<a class="btn btn-sm btn-danger" href="/admin/deleteProduct/<%=product.getPid()%>"><i class="fa-solid fa-trash"></i> Delete</a>
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