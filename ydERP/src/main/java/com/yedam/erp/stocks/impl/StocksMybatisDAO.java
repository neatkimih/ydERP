package com.yedam.erp.stocks.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.StockOnhandViewVO;
import com.yedam.erp.stocks.StockOnhandsVO;
import com.yedam.erp.stocks.StocksInOutVO;
import com.yedam.erp.stocks.StocksVO;

@Repository
public class StocksMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<StocksInOutVO> getStocksList(StocksVO vo) {
		return sqlSession.selectList("stocks.getStocksList", vo);
	}

	public List<StockOnhandViewVO> getStockOnhandsList(StockOnhandsVO vo) {
		return sqlSession.selectList("stocks.getStockOnhandList", vo);
	}
}
