package com.yedam.erp.stocks.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.StockInOutViewVO;
import com.yedam.erp.stocks.StockInOutVO;

@Repository
public class StockInOutMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<StockInOutViewVO> getStockInOutList(StockInOutVO vo) {
		return sqlSession.selectList("stocks.getStockInOutList", vo);
	}
	
	public List<StockInOutViewVO> getItemInOutList(StockInOutVO vo){
		return sqlSession.selectList("stocks.getItemInOutList", vo);
	}

}
