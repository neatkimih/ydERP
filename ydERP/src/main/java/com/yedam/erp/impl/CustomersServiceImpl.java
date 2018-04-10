package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.CustomersService;
import com.yedam.erp.sales.CustomersVO;

@Service
public class CustomersServiceImpl {
	
	@Autowired
	private CustomersMybatisDAO customersDAO;
	

}
