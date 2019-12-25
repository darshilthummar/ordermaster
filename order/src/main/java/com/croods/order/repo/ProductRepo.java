package com.croods.order.repo;

import java.util.List;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.croods.order.model.Product;

public interface ProductRepo extends JpaRepository<Product, Long>, DataTablesRepository<Product, Long> 
{
	List<Product> findByPid(Long pid);
}
