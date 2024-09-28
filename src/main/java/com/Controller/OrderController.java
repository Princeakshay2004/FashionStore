package com.Controller;


import java.sql.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Entity.OrderDetail;
import com.Entity.Product;
import com.Entity.User;
import com.Froms.orderForm;
import com.Helper.Message;
import com.Service.orderService;
import com.Service.productService;
import com.Service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private productService productService;
	@Autowired
	private userService userService;
	@Autowired
	private orderService orderService;
	
	@GetMapping("")
	public String order(HttpSession session) {
		return "OrderDetails";
	}
	
	@PostMapping("/saveOrder/{Id}")
	public String saveOrder(@ModelAttribute orderForm orderForm,@PathVariable String Id ,@RequestParam String pid,HttpSession session)
	{
		OrderDetail order=new OrderDetail();
		String id=UUID.randomUUID().toString();
		order.setOid(id);
		order.setFirstName(orderForm.getFirstname());
		order.setLastname(orderForm.getLastname());
		order.setMobileno(orderForm.getMobileno());
		order.setEmail(orderForm.getEmail());
		order.setAddress(orderForm.getAddress());
		order.setCity(orderForm.getCity());
		order.setOrderDate(new Date(System.currentTimeMillis()));
		order.setState(orderForm.getState());
		order.setPincode(orderForm.getPincode());
		order.setPaymentType(orderForm.getPaymentType());
		order.setPrice(orderForm.getTotalprice());
		order.setStatus("In Progress");
		
		Product product=productService.getProductById(pid);
		if(product!=null) {
		order.setProduct(product);
		order.setTitle(product.getpTitle());
		order.setImage(product.getpImage());
		order.setQuentity("1");
		}
		User user=userService.getUserById(Id);
		order.setUser(user);
		
		try {
			orderService.saveOrder(order);
			Message msg=new Message("Your Order Placed Successfully , Continoue Shopping","alert-success");
			session.setAttribute("Products", msg);
		}
		catch (Exception e) {
			Message msg=new Message("Something went wrong please try again !","alert-danger");
			session.setAttribute("Products", msg);
		}
		return "redirect:/products/list";
	}
	
	@GetMapping("/myorder/{ID}")
	public String myOrder(@PathVariable String ID,HttpSession session)
	{
		User user1=userService.getUserById(ID);
		System.out.println("User NAme"+user1.getName());
		List<OrderDetail>orderdetail=orderService.getorderByUser(user1);
		session.setAttribute("orderdetail", orderdetail);
		return"myOrder";
	}
	@GetMapping("/cancel/{ID}")
	public String cancelOrder(@PathVariable String ID,HttpSession session,@RequestParam String uid)
	{
		OrderDetail order=orderService.findbyId(ID);
		order.setStatus("Order Cancelled");
		try {
			orderService.saveOrder(order);
			Message msg=new Message("Your Order Cancelled Successfully , Continoue Shopping","alert-success");
			session.setAttribute("myorder", msg);

		}
		catch (Exception e) {
			Message msg=new Message("Something went wrong!","alert-danger");
			session.setAttribute("myorder", msg);		}
		
		return "redirect:/order/myorder/"+uid;
	}
	
	
	

}
