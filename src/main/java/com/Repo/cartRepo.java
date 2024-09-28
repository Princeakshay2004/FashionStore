package com.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.Cart;
import com.Entity.Product;
import com.Entity.User;

@Repository
public interface cartRepo extends JpaRepository<Cart, String> {

	Cart findByProductAndUser(Product product, User user);

	List<Cart> findByUser(User user);
}
