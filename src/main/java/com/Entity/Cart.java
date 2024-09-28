package com.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Cart {

	@Id
	private String Id;
	@ManyToOne
	private User user;
	@ManyToOne
	private Product product;
	private Integer Quantity;
	private double total;
	private double totalPrice;
	
	public Cart() {
		super();
	}

	public Cart(String id, User user, Product product, Integer quantity, double total) {
		super();
		Id = id;
		this.user = user;
		this.product = product;
		Quantity = quantity;
		this.total = total;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return Quantity;
	}

	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	

}
