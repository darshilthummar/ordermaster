package com.croods.order.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="Customer_tbl")
public class Customer 
{	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long cid;
	@Column(name="F_Name")
	private String fname;
	@Column(name="L_Name")
	private String lname;
	@Column(name="Mobile")
	private String mobile;
}
