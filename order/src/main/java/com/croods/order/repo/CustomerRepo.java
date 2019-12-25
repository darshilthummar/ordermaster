package com.croods.order.repo;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.croods.order.model.Customer;


public interface CustomerRepo extends JpaRepository<Customer, Long>,DataTablesRepository<Customer, Long> 
{

}
