
package com.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.Product;

@Repository
public interface productRepo extends JpaRepository<Product, String> {

	List<Product> findByPCategory(String pCategory);

	List<Product> findByPTitleContainingOrPCategoryContaining(String pTitle, String pcategory);

}
