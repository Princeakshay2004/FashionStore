package com.Service;

import java.util.List;

import com.Entity.Product;

public interface productService {
	Product saveProduct(Product product);

	Product getProductById(String id);

	List<Product> getProductByCategory(String category);

	Product updateProduct(Product product);

	void deleteProduct(String id);

	boolean isProductExist(String productId);

	List<Product> getAllProducts();

	List<Product> findByserach(String title, String category);
}
