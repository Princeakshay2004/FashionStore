<%@page import="com.Entity.User"%>
<%
User user1=(User)request.getAttribute("CurrentUser");
%>
<!-- Profile Modal -->
<div class="modal fade mt-5 bd-example-modal-sm" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="margin-left: 35em">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
			<div class="modal-body">
				<%if(user1!=null)
					{
					%>
					<div class="text-center mb-2">
						<img src="<%=user1.profileurl(user1)%>" style="border-radius: 50%;height: 5em;width: 5em;object-fit:cover;">
					</div>
					<h5 class="text-center fw-bold"><%=user1.getName()%></h5>
					
					<div class="text-center">
					<p ><%=user1.getEmail()%></p>
					<h6>Profile</h6>
					</div>
					<%
						if(user1.getRole().equals("ADMIN"))
						{
						%>
				  <div class="mb-2">
					 <a class="nav-link ms-4 text-primary " aria-current="page" href="/admin"><i class="fa-solid fa-gear"></i> Account Setting</a>
				  </div>
						<% 	
						}
						%>
				 
			      <div class="mb-2">
					 <a class="nav-link ms-4 text-success " aria-current="page" href="/updateProfile"><i class="fa-solid fa-pen"></i> Edit Profile</a>
				  </div>
				  <div class="mb-4">
					 <a class="nav-link ms-4 text-warning " aria-current="page" href="/order/myorder/<%=user1.getuId()%>"><i class="fa-solid fa-gift"></i> Your Orders</a>
				  </div>
				  <hr>
				 <div class="mb-1 text-center">
			       <button type="button" class="btn btn-secondary"data-bs-dismiss="modal">Close</button>
				 	 <a class="btn btn-outline-danger ms-4 " aria-current="page" href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
				  </div>
				  <%} %>
			</div>
		</div>
	</div>
</div>
<!-- Profile Modal -->



