package com.Controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Entity.OrderDetail;
import com.Entity.Product;
import com.Entity.User;
import com.Froms.productForm;
import com.Helper.FileUploadHelper;
import com.Helper.Message;
import com.Service.orderService;
import com.Service.productService;
import com.Service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private productService productService;
	@Autowired
	private userService userService;
	@Autowired
	private FileUploadHelper fileUploadHelper;
	@Autowired
	private orderService orderService;

	@GetMapping("")
	public String admin() {
		return "admin";
	}

	@PostMapping("/saveProduct")
	public String saveProduct(@ModelAttribute productForm productForm, HttpSession session, BindingResult result) {
		if (result.hasErrors()) {
			Message msg = new Message("Please Provide Valid Infrmation", "alert-danger");
			session.setAttribute("productMsg", msg);
			return "redirect:/admin";
		}

		Product product = new Product();
		String Id = UUID.randomUUID().toString();
		product.setPid(Id);
		product.setpTitle(productForm.getProductName());
		product.setpCategory(productForm.getProductCategory());
		product.setpDescription(productForm.getProductDescription());
		product.setpPrize(productForm.getProductPrize());
		product.setpQuantity(productForm.getProductQuantity());
		product.setpDiscount(productForm.getProductDiscount());
		MultipartFile multipartFile = productForm.getProductImage();
		product.setpImage(multipartFile.getOriginalFilename().toString());
		fileUploadHelper.uploadFile(multipartFile);

		try {
			productService.saveProduct(product);
			Message msg = new Message("product Upload Successfully", "alert-success");
			session.setAttribute("productMsg", msg);
		} catch (Exception e) {
			Message msg = new Message("Please Provide Valid Infrmation", "alert-danger");
			session.setAttribute("productMsg", msg);
		}
		return "redirect:/admin";
	}

	@GetMapping("/listProducts")
	public String listProducts(HttpSession session) {
		List<Product> products = productService.getAllProducts();
		session.setAttribute("ProductList", products);
		return "listProducts";
	}

	@GetMapping("/editProduct/{Id}")
	public String editProduct(@PathVariable String Id, HttpSession session) {
		Product product = productService.getProductById(Id);
		session.setAttribute("product", product);
		return "editProduct";

	}

	@PostMapping("/updateProduct/{Id}")
	public String updateProduct(@PathVariable String Id, HttpSession session, @ModelAttribute productForm productForm) {
		Product product = productService.getProductById(Id);
		product.setPid(Id);
		product.setpTitle(productForm.getProductName());
		product.setpCategory(productForm.getProductCategory());
		product.setpDescription(productForm.getProductDescription());
		product.setpDiscount(productForm.getProductDiscount());
		if (productForm.getProductImage().isEmpty()) {
			product.setpImage(product.getpImage());
		} else {
			MultipartFile multipartFile = productForm.getProductImage();
			fileUploadHelper.uploadFile(multipartFile);
			product.setpImage(multipartFile.getOriginalFilename().toString());
		}

		product.setpPrize(productForm.getProductPrize());
		product.setpQuantity(productForm.getProductQuantity());

		try {
			productService.updateProduct(product);
			Message msg = new Message("Product Updated Successfully", "alert-success");
			session.setAttribute("productoperation", msg);
		} catch (Exception e) {
			// TODO: handle exception
			Message msg = new Message("Error while Updating product", "alert-danger");
			session.setAttribute("productoperation", msg);
		}

		return "redirect:/admin/listProducts";
	}

	@GetMapping("/deleteProduct/{Id}")
	public String deleteProduct(@PathVariable String Id, HttpSession session) {
		productService.deleteProduct(Id);
		Message msg = new Message("Product Deleted Successfully", "alert-success");
		session.setAttribute("productoperation", msg);
		return "redirect:/admin/listProducts";
	}

	@GetMapping("/listUsers")
	public String listUsers(HttpSession session) {
		List<User> users = userService.getAllUser();
		session.setAttribute("UserList", users);
		for (User user : users) {
			System.out.println(user.getName());
		}
		return "listUsers";
	}

	@GetMapping("/updateStatus/{id}/{status}")
	public String updateUserStatus(@PathVariable String id, @PathVariable boolean status, HttpSession session) {
		User user = userService.getUserById(id);
		user.setEnabled(status);
		try {
			userService.saveUser(user);
			Message msg = new Message("User Status Updated", "alert-success");
			session.setAttribute("statusMsg", msg);
		} catch (Exception e) {
			Message msg = new Message("Error While updating Status", "alert-danger");
			session.setAttribute("statusMsg", msg);
		}
		return "redirect:/admin/listUsers";
	}
	
	@GetMapping("/listOrders")
	public String listOrders(HttpSession session)
	{
		List< OrderDetail> orders=orderService.getallOrder();
		session.setAttribute("OrdersList", orders);
		
		return"listOrders";
	}

	@PostMapping("/updateSatus/{Id}")
	public String updateStatus(@PathVariable String Id,@RequestParam("orderStatus") String orderStatus,HttpSession session)
	{
		OrderDetail order=orderService.findbyId(Id);
		order.setStatus(orderStatus);
		try {
			orderService.saveOrder(order);
			Message msg=new Message("Order Status Updated","alert-success");
			session.setAttribute("orderStatus", msg);
		}
		catch (Exception e) {
			// TODO: handle exception
			Message msg=new Message("Something went wrong","alert-danger");
			session.setAttribute("orderStatus", msg);
		}
		
		return"redirect:/admin/listOrders";
	}
	
	
}
