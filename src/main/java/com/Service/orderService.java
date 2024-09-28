package com.Service;

import java.util.List;
import com.Entity.OrderDetail;
import com.Entity.User;

public interface orderService {

	OrderDetail saveOrder(OrderDetail order);

	List<OrderDetail> getorderByUser(User user);

	OrderDetail findbyId(String id);
	
	List<OrderDetail> getallOrder();
		
}
