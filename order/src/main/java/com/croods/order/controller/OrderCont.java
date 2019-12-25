package com.croods.order.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.croods.order.model.Customer;
import com.croods.order.model.Order;
import com.croods.order.model.Product;
import com.croods.order.repo.CustomerRepo;
import com.croods.order.repo.OrderRepo;
import com.croods.order.repo.ProductRepo;

@Controller
@RequestMapping("/")
public class OrderCont 
{
	
	//******* CUSTOMER  ********//

	@Autowired
	CustomerRepo customerrepo;
	
	@GetMapping("/customer")
	public String addCustomer(Model m )
	{
		m.addAttribute("customers", customerrepo.findAll());
		return "customer";
	}
	
	@RequestMapping("/customer/data")
	@ResponseBody
	public DataTablesOutput<Customer> getCustomer(@RequestBody DataTablesInput input) 
	{ 
		System.out.println("000000000000");
	  return  customerrepo.findAll(input);
	}
	
	@PostMapping("/save/customer")
	@ResponseBody
	public Customer getCustomer(@ModelAttribute Customer c)
	{
		 return customerrepo.save(c);
		
	}
	
	@GetMapping("/customers")
	@ResponseBody
	public List<Customer> getCustomers()
	{
		return customerrepo.findAll();
	}
	
	
	
	
	//********  PRODUCT  ********//
	
	@Autowired
	ProductRepo productrepo;
	
	@GetMapping("/product")
	public String addProduct(Model m)
	{
		m.addAttribute("products", productrepo.findAll());
		
		return "product";
	}
	
	@RequestMapping("/product/data")
	@ResponseBody
	public DataTablesOutput<Product> getUsers(@RequestBody DataTablesInput input) 
	{
		//System.out.println("000000000000");
	  return productrepo.findAll(input);
	}
	
	@GetMapping("/product/delete/{id}")
	@ResponseBody
	public String deleteproduct(@PathVariable Long id)
	{
		
		productrepo.deleteById(id);
		return "done";
	}
	@GetMapping("/product/edit/{id}")
	@ResponseBody
	public Product editproduct(@PathVariable Long id)
	{
		return productrepo.findById(id).orElse(null);
		
	}
	
	
	@PostMapping("/product/save")
	@ResponseBody
	public Product getProduct(@ModelAttribute Product p)
	{
		 
		 return productrepo.save(p);
	}
	
	@GetMapping("/products")
	@ResponseBody
	public List<Product> getProducts()
	{
		return productrepo.findAll();
	}
	
	@GetMapping("/products/{pid}")
	@ResponseBody
	public Optional<Product> getPid(@PathVariable long pid)
	{
		return productrepo.findById(pid);
	}
	
	
	//********   ORDER   ******//
	
	@Autowired
	OrderRepo orderrepo;
	
	@GetMapping(value= {" ","/","/order"})
	public String addOrder()
	{
		return "order";
	}
	
	@PostMapping("/save/order")
	public String getOrder(@ModelAttribute Order or)
	{
		
		System.out.println("--SAVE ORDER--");
		System.out.println(or.getOrderitem().get(0).getQuantity());
		
		or.getOrderitem().forEach((oi->
		{
			oi.setOrder(or);
			
		}));
		
		
		
		 orderrepo.save(or);
		 return "redirect:/";
	}
	}

