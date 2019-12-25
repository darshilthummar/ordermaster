package com.croods.order.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.croods.order.model.Order;

public interface OrderRepo extends JpaRepository<Order, Long> {

}
