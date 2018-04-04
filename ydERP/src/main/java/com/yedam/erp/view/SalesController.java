package com.yedam.erp.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.yedam.erp.sales.SalesService;

@Controller
public class SalesController{

	@Autowired
	SalesService salesService;
	
	
	
}