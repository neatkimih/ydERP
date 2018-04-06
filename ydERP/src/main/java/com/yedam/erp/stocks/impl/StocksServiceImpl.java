package com.yedam.erp.stocks.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.StockOnhandViewVO;
import com.yedam.erp.stocks.StockOnhandsVO;
import com.yedam.erp.stocks.StocksInOutVO;
import com.yedam.erp.stocks.StocksService;
import com.yedam.erp.stocks.StocksVO;

@Service
public class StocksServiceImpl implements StocksService {

	@Autowired
	StocksMybatisDAO dao;

	public List<StocksInOutVO> getStocksList(StocksVO vo) {
		return dao.getStocksList(vo);
	}

	public List<StockOnhandViewVO> getStockOnhandsList(StockOnhandsVO vo) {
		return dao.getStockOnhandsList(vo);
	}
}
