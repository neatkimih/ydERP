package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.LookupCodes;

@Service
public class HomeServiceImpl {

	@Autowired
	HomeMybatisDAO dao;

	public List<Map<String, String>> getMostSoldItem() {
		return dao.getMostSoldItem();
	}

	public List<Map<String, String>> getMostBuyItem() {
		return dao.getMostBuyItem();
	}

	public List<Map<String, Object>> getInOutQtyChart() {
		return dao.getInOutQtyChart();
	}

	public List<Map<String, Object>> getInOutAmtChart() {
		return dao.getInOutAmtChart();
	}

	public List<Map<String, Object>> getLookups(String LOOKUP) {
		return dao.getLookups(LOOKUP);
	}

	public List<Map<String, String>> getLookValues() {
		return dao.getLookValues();
	}

	public List<Map<String, String>> selectLookups(String str) {
		return dao.selectLookups(str);
	}

	public void updateLookups(LookupCodes vo) {
		dao.updateLookups(vo);
	}

}
