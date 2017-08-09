package com.wldd.service;

import java.util.List;

import com.wldd.entity.Order;

public interface OrderService {
	void createOrder(Order order);

	List<Order> findAllComplete();

	List<Order> findAllUnComplete();

	List<Order> findAllCompleteByUser(String uid);

	List<Order> findAllUnCompleteByUser(String uid);

	Order findById(String orderId);
}
