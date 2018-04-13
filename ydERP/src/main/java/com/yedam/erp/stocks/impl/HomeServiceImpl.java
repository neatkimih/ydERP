package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl {

	@Autowired
	HomeMybatisDAO dao;

	public List<Map<String, String>> getMostSoldItem() {
		return dao.getMostSoldItem();
	}
}
