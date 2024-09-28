package com.ServiceImpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Cart;
import com.Entity.Product;
import com.Entity.User;
import com.Repo.cartRepo;
import com.Repo.productRepo;
import com.Repo.userRepo;
import com.Service.cartService;

@Service
public class cartServiceImpl implements cartService {

	@Autowired
	private cartRepo cartRepo;
	@Autowired
	private productRepo productRepo;
	@Autowired
	private userRepo userRepo;

	@Override
	public Cart saveCart(String pid, String uid) {
		User user = userRepo.findById(uid).orElse(null);
		System.out.print(user.getName());
		Product product = productRepo.findById(pid).orElse(null);
		System.out.print(product.getpTitle());
		Cart cartstatus = cartRepo.findByProductAndUser(product, user);
		String id = UUID.randomUUID().toString();

		if (cartstatus == null) {
			Cart cart = new Cart();
			cart.setId(id);
			cart.setProduct(product);
			cart.setUser(user);
			cart.setQuantity(1);
			cart.setTotal(1 * product.getDiscountedPrize());
			return cartRepo.save(cart);

		} else {
			Cart cart1 = cartstatus;
			cart1.setQuantity(cart1.getQuantity() + 1);
			cart1.setTotal(cart1.getQuantity() * cart1.getProduct().getDiscountedPrize());
			return cartRepo.save(cart1);
		}

	}

	@Override
	public List<Cart> getcartByUser(User user) {
		return cartRepo.findByUser(user);

	}

	@Override
	public Cart findbyId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateQuantity(String opeartion, String pid) {
		Cart cart = cartRepo.findById(pid).orElse(null);
		int quantity = 0;
		if (opeartion.equals("minus")) {
			quantity = cart.getQuantity() - 1;
			cart.setQuantity(quantity);
			cartRepo.save(cart);
		} else if (opeartion.equals("plus")) {
			quantity = cart.getQuantity() + 1;
			cart.setQuantity(quantity);
			cartRepo.save(cart);
		}
		if (quantity <= 0) {
			cartRepo.deleteById(cart.getId());
		}
	}

}
