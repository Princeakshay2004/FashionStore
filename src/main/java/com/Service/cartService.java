package com.Service;

import java.util.List;

import com.Entity.Cart;
import com.Entity.User;

public interface cartService {

	Cart saveCart(String pid, String uid);

	List<Cart> getcartByUser(User user);

	Cart findbyId(String id);

	void updateQuantity(String opeartion, String pid);

}
