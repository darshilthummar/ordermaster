package com.croods.order.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.croods.order.model.Order;
import com.croods.order.repo.OrderRepo;
@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired OrderRepo or;
	@Override
	public Order saveorder(Order o) {
		// TODO Auto-generated method stub
		return or.save(o);
	}

}
