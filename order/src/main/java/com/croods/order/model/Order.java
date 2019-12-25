package com.croods.order.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import lombok.Data;

@Data
@Entity
@Table(name="Order_tbl")
public class Order 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long oid;
	@Column(name="Date")
	private String date;
	@Column(name="amount")
	private Double tamount;
	
	@ManyToOne()
	@JoinColumn(name = "customer_id",referencedColumnName = "cid", nullable = false)
	private Customer customer;
	
	@LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Orderitem> orderitem;
}
