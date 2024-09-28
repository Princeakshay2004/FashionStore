package com.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entity.OrderDetail;
import com.Entity.User;
import com.Repo.orderRepo;
import com.Service.orderService;

@Service
public class orderServiceImpl implements orderService {

	@Autowired
	private orderRepo orderRepo;
	
	@Override
	public OrderDetail saveOrder(OrderDetail order) {
		// TODO Auto-generated method stub
			return orderRepo.save(order);
	}

	@Override
	public List<OrderDetail> getorderByUser(User user) {
		return orderRepo.findByUser(user);
	}

	@Override
	public OrderDetail findbyId(String id) {
		return orderRepo.findById(id).orElse(null);
	}

	@Override
	public List<OrderDetail> getallOrder() {
		// TODO Auto-generated method stub
		return orderRepo.findAll();
	}

}
