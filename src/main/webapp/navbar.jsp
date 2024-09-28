<%@page import="com.Entity.User"%>
<%
		User user=(User)request.getAttribute("CurrentUser");
%>
<nav class="navbar fixed-top navbar-expand-lg navbarbg navbar-light shadow-lg">
  <div class="container-fluid ps-5 pe-5 ">
    <a class="navbar-brand " href="/" style="font-weight:600;font-size: 1.2rem "><img  src="/img/icon.png" class="mb-1" style="height: 20px;width: 20px"/> FashionStore</a>
    
    <div class="collapse navbar-collapse "id="navbarSupportedContent">
      <ul class="navbar-nav me-2 mb-2 mb-lg-0">
        
        <li class="nav-item me-2">
          <a class="nav-link active" aria-current="page" href="/products/list"><i class="fa-brands fa-shopify"></i> Products</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Category
          </a>
          <ul class="dropdown-menu navbarbg " aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/products/categoryLoad/Men">Man</a></li>
            <li><a class="dropdown-item" href="/products/categoryLoad/Women">Women</a></li>
            <li><a class="dropdown-item" href="/products/categoryLoad/Boy">Boy</a></li>
            <li><a class="dropdown-item" href="/products/categoryLoad/Girl">Girl</a></li>
            <li><a class="dropdown-item" href="/products/categoryLoad/Traditional">Traditional</a></li>
          </ul>
        
        </li>
      </ul>
      <%--Serch Box --%>
      <form class="d-flex col-md-5 ms-2" action="/products/searchResult" method="get">
        <input class="form-control col-md-4" name="search" type="search" placeholder="Search for product, Brands and More" aria-label="Search">
        <button class="form-control ms-1" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
      <%
      if(user==null)
      {
    	  %>
     <%-- left Content --%>
         <ul class="navbar-nav ms-auto">
		 <li class="nav-item me-2"><a class="nav-link" aria-current="page" href="/login" ><i class="fa-solid fa-heart"></i> Wishlist</a></li>
        <li class="nav-item me-2"><a class="nav-link" aria-current="page" href="/login" ><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
		<li class="nav-item me-2"><a class="nav-link active" aria-current="page" href="/login"><i class="fa-solid fa-user"></i> Login</a></li>
    	<% 
      }
      else{
    %>
      <%-- left Content --%>
       	<ul class="navbar-nav ms-auto">
		<li class="nav-item me-2"><a class="nav-link active" aria-current="page" href="/wishlist" ><i class="fa-solid fa-heart"></i> Wishlist</a></li>
        <li class="nav-item me-2"><a class="nav-link active" aria-current="page" href="/cart/viewCart/<%=user.getuId()%>" ><i class="fa-solid fa-cart-shopping"></i> Cart</a></li>
        <%
        if(user.getRole().equals("ADMIN"))
        {
        	%>
		<li class="nav-item me-2">
		<a class="nav-link active" aria-current="page" href="#"data-bs-toggle="modal" data-bs-target="#profileModal"><img style="height: 25px;width: 25px;border-radius: 50%;object-fit:cover;" src="<%=user.profileurl(user)%>"/></a>
		 </li>        	
        	<%
        }
        else{
        	%>
<li class="nav-item me-2">
		<a class="nav-link active" aria-current="page" href="#"data-bs-toggle="modal" data-bs-target="#profileModal"><img style="height: 25px;width: 25px;border-radius: 50%;object-fit:cover;" src="<%=user.profileurl(user)%>"/></a>
		 </li>        	<%
        }
        %>        
     <%
      }
      %>
     
      
	</ul>
  </div>
 </div>
</nav>
<%@include file="Models.jsp" %>		










