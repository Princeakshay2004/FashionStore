package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Entity.Cart;
import com.Entity.User;
import com.Helper.Message;
import com.Service.cartService;
import com.Service.userService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private cartService cartService;
	@Autowired
	private userService userService;

	@GetMapping("/add")
	public String add(@RequestParam String uid, @RequestParam String pid, HttpSession session) {
		try {
			cartService.saveCart(pid, uid);
			Message msg = new Message("Product Successfully added to cart", "alert-success");
			session.setAttribute("cart", msg);
		} catch (Exception e) {
			Message msg = new Message("Error while adding product To cart", "alert-danger");
			session.setAttribute("cart", msg);
			e.printStackTrace();
		}
		return "redirect:/products/productView/" + pid;
	}

	@GetMapping("/viewCart/{Id}")
	public String viewCart(@PathVariable String Id, HttpSession session) {
		User user = userService.getUserById(Id);
		List<Cart> cart = cartService.getcartByUser(user);
		session.setAttribute("CartList", cart);
		return "cart";
	}

	@GetMapping("/update/{Operation}")
	public String updateQuantity(@RequestParam String uid, @RequestParam String pid, @PathVariable String Operation,
			HttpSession session) {
		cartService.updateQuantity(Operation, pid);
		return "redirect:/cart/viewCart/" + uid;
	}

}
