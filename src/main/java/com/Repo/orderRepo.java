package com.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Entity.OrderDetail;
import com.Entity.User;

import java.util.List;



@Repository
public interface orderRepo extends JpaRepository<OrderDetail, String>{
	
	
	List<OrderDetail> findByUser(User user);
}
