<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page errorPage="error.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FashionStore</title>
<%@include file="base.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>
<%-- Slider --%>
<div class="shadow-lg rounded" style="margin-top: 4em">
<div id="carouselExampleIndicators" class="carousel slide bg-dark" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>    
  </div>
  <div class="carousel-inner">
    <div class="carousel-item ">
    <a href="/products/categoryLoad/men">
      <img src="/img/slider1.png" style="height: 430px;width: 100%;object-fit:fill;" >
      </a>
    </div>
    <div class="carousel-item ">
    <a href="/products/categoryLoad/women">
      <img src="/img/slider2.png" style="height: 430px;width: 100%;object-fit:fill;" >
      </a>
    </div>
    <div class="carousel-item ">
    <a href="/products/categoryLoad/women">
      <img src="/img/slider3.png" style="height: 430px;width: 100%;object-fit:fill;" >
      </a>
    </div>
    <div class="carousel-item active ">
    <a href="/products/categoryLoad/Traditional">
      <img src="/img/slider4.png" style="height: 430px;width: 100%;object-fit:fill;" >
      </a>
    </div>
    <div class="carousel-item ">
    <a href="/products/categoryLoad/women">
      <img src="/img/slider5.png" style="height: 430px;width: 100%;object-fit:fill;" >
      </a>
    </div>
  </div>
  <button class="carousel-control-prev textbg" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon textbg" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next textbg" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon textbg" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<%-- Slider End--%>
<%--Categories  --%>

<div class="row col-md-12">

<div class="card mt-3 me-0 shadow-lg rounded" style=" margin-left: 10px">
  <div class="card-body">
    <h5 class="card-title text-center">Categories</h5>
     <div class="container">
     <div class="row">
     <%--Category 1 --%>   
     <div class="card col-md-2 m-3 ms-4 shadow">
     <a href="/products/categoryLoad/Men" class="text-decoration-none text-dark">
   	<div class="d-flex justify-content-center">
	<img class="m-3" src="/img/men.png" style="width: 200px; height: 200px">
	</div>
     <p class="text-center fw-bold">Man</p>
     </a>
     </div>
     <%--Category 2 --%> 
     <div class="card col-md-2 m-3 ms-4 shadow">
          <a href="/products/categoryLoad/Women" class="text-decoration-none text-dark">
   	<div class="d-flex justify-content-center">
	<img class="m-3" src="/img/women.png" style="width: 200px; height: 200px">
	</div>
     <p class="text-center fw-bold">Woman</p>
     </a>
     </div>
     <%--Category 3 --%> 
        <div class="card col-md-2 m-3 ms-4 shadow">
             <a href="/products/categoryLoad/Boy" class="text-decoration-none text-dark">
   	<div class="d-flex justify-content-center">
	<img class="m-3" src="/img/boy.png" style="width: 200px; height: 200px">
	</div>
     <p class="text-center fw-bold">Boy</p>
     </a>
     </div>
     <%--Category 4 --%> 
        <div class="card col-md-2 m-3 ms-4 shadow">
             <a href="/products/categoryLoad/Girl" class="text-decoration-none text-dark">
   	<div class="d-flex justify-content-center">
	<img class="m-3" src="/img/girl.png" style="width: 200px; height: 200px">
	</div>
     <p class="text-center fw-bold">Girl</p>
     </a>
     </div>
     <%--Category 5 --%> 
        <div class="card col-md-2 m-3 ms-4 shadow">
             <a href="/products/categoryLoad/Traditional" class="text-decoration-none text-dark">
   	<div class="d-flex justify-content-center">
	<img class="m-3" src="/img/traditional.png" style="width: 200px; height: 200px">
	</div>
     <p class="text-center fw-bold">Traditional</p>
     </a>
     </div>
     </div>
  </div>
</div>
</div>
</div>



<%--Categories End --%>

</body>
<%-- Footer Start Here --%>
<footer>
<%@include file="footer.jsp" %>
</footer>
</html>