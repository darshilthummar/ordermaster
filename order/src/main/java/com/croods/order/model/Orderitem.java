package com.croods.order.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="order_item_tbl")
public class Orderitem 
{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long otid;
	@Column(name="quantity")
	private int quantity;
	@Column(name="Amount")
	private double amount;
	
	@ManyToOne()
	@JoinColumn(name = "Product_ID",referencedColumnName = "pid",nullable = false)
	private Product product;
	
	@ManyToOne()
	@JoinColumn(name = "Order_id",referencedColumnName = "oid",nullable = false)
	private Order order;
}
