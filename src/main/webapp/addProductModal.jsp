<!--Add Product Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog d-flex justify-content-center">
    <div class="modal-content">
      <div class="modal-header  navbarbg">
        <h5 class="modal-title text-center" id="exampleModalLabel">Fill Category Details</h5>
       
      </div>
      <div class="modal-body">
       	<form class="row" action="/admin/saveProduct" method="post" enctype="multipart/form-data">
       		  <div class="form-group mb-2">
			    <label for="title">Product Name</label>
			    <input name="productName" type="text" class="form-control" id="productName" aria-describedby="emailHelp" placeholder="Enter Product Name">
			  </div>
			  <div class="d-flex">
			   <div class="form-group col-md-3 m-1">
			    <label for="title"> Quantity</label>
			    <input name="productQuantity" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" >
			  </div>
			  
			  <div class="form-group col-md-4 m-1">
			    <label for="title"> Prize</label>
			    <input name="productPrize" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" >
			  </div>
			  <div class="form-group col-md-4 m-1">
			    <label for="title"> Discount</label>
			    <input name="productDiscount" type="text" class="form-control" id="categoryTitle" aria-describedby="emailHelp" >
			
			  </div>
			  </div>
			   <div class="form-row">
			  <div class="form-group mb-2">
			    <label for="title">Product Image</label>
			    <input name="productImage" type="file" class="form-control" id="categoryTitle" aria-describedby="emailHelp" placeholder="Upload Product Pic">
			  </div>
			  <div class="form-group mb-2">
		    	<label for="title">Product Category</label>
				<select id="category" name="productCategory"  class="form-select" required="required">
       			    <option selected="selected" disabled="disabled">Choose...</option>
			        <option value="Men">Men</option>
			        <option value="Women">Women</option>
			        <option value="Boy">Boy</option>
			        <option value="Girl">Girl</option>
			        <option value="Traditional">Traditional</option>
				</select>					  
				</div>	
			  </div>
			  <div class="form-group">
			    <label for="text">ProductDescription</label>
			    <textarea rows="3" name="productDescription" class="form-control" id="categoryDescription"placeholder="Enter Product Description"></textarea>
			  </div>		  
			  <div class="d-flex justify-content-center mt-3">
       			<button type="button" class="btn btn-outline-secondary me-2" data-bs-dismiss="modal">Close</button>
        		<button type="submit" class="btn btn-outline-success ms-2 ">Add Product</button>
        		</div>
       	</form>
      </div>     
    </div>
  </div>
</div>
