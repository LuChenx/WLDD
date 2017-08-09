package com.wldd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wldd.dao.OrderDao;
import com.wldd.entity.Order;
import com.wldd.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;

	public void createOrder(Order order) {
		orderDao.createOrder(order);
	}

	public List<Order> findAllComplete() {

		return orderDao.findAllComplete();
	}

	public List<Order> findAllUnComplete() {

		return orderDao.findAllUnComplete();
	}

	public Order findById(String orderId) {

		return orderDao.findById(orderId);
	}

	public List<Order> findAllCompleteByUser(String uid) {
		return orderDao.findAllCompleteByUser(uid);
	}

	public List<Order> findAllUnCompleteByUser(String uid) {
		return orderDao.findAllUnCompleteByUser(uid);
	}

}
