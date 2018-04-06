package com.yedam.erp.stocks.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.StockOnhandVO;
import com.yedam.erp.stocks.StockOnhandViewVO;

@Repository
public class StockOnhandMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandVO vo) {
		return sqlSession.selectList("stocks.getStockOnhandList", vo);
	}

}
