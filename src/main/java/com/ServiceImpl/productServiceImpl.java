package com.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.Product;
import com.Repo.productRepo;
import com.Service.productService;

@Service
public class productServiceImpl implements productService {

	@Autowired
	private productRepo productRepo;

	@Override
	public Product saveProduct(Product product) {
		return productRepo.save(product);
	}

	@Override
	public List<Product> getAllProducts() {
		return productRepo.findAll();

	}

	@Override
	public Product getProductById(String id) {
		// TODO Auto-generated method stub
		return productRepo.findById(id).orElse(null);
	}

	@Override
	public Product updateProduct(Product product) {
		// TODO Auto-generated method stub
		return productRepo.save(product);
	}

	@Override
	public void deleteProduct(String id) {

		// Optional<Product> product= productService.getProductById(id);
		productRepo.deleteById(id);

	}

	@Override
	public boolean isProductExist(String productId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Product> getProductByCategory(String category) {
		return productRepo.findByPCategory(category);
	}

	@Override
	public List<Product> findByserach(String title, String category) {
		return productRepo.findByPTitleContainingOrPCategoryContaining(title, category);
	}

}
