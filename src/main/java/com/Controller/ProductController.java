package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Entity.Product;
import com.Service.productService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private productService productService;

	@GetMapping("/list")
	public String products(HttpSession session) {
		List<Product> products = productService.getAllProducts();
		session.setAttribute("ProductList", products);
		return "products";
	}

	@GetMapping("/categoryLoad/{Category}")
	public String categoryLoad(@PathVariable String Category, HttpSession session) {
		List<Product> product = productService.getProductByCategory(Category);
		session.setAttribute("ProductList", product);
		return "products";
	}

	@GetMapping("/searchResult")
	public String searchResult(@RequestParam("search") String search, HttpSession session) {
		List<Product> product = productService.findByserach(search, search);
		session.setAttribute("Productsearch", product);
		return "searchProduct";
	}

	@GetMapping("/productView/{productId}")
	public String productView(@PathVariable String productId, HttpSession session) {
		Product product = productService.getProductById(productId);
		session.setAttribute("productView", product);
		return "viewProduct";
	}

}
