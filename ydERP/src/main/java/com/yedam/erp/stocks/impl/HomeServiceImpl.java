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

	public List<Map<String, Object>> getLookups() {
		return dao.getLookups();
	}

	public List<Map<String, String>> getLookValues() {
		return dao.getLookValues();
	}

	public List<Map<String, String>> selectLookups(String str) {
		return dao.selectLookups(str);
	}

}
