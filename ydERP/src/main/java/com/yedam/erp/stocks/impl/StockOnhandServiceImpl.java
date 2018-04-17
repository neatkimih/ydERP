package com.yedam.erp.stocks.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.StockOnhandService;
import com.yedam.erp.stocks.StockOnhandViewVO;

@Service
public class StockOnhandServiceImpl implements StockOnhandService {

	@Autowired
	StockOnhandMybatisDAO dao;

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandViewVO vo) {
		return dao.getStockOnhandList(vo);
	}

	public List<StockOnhandViewVO> getVendorList(StockOnhandViewVO vo) {
		return dao.getVendorList(vo);
	}

}
