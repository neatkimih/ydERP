package com.yedam.erp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.sales.SalesVO;

@Repository
public class SalesMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/* 판매 내역 전체 조회 */
	public List<SalesVO> getSaleList(SalesVO vo) {
		return mybatis.selectList("sales.getSaleList", vo);
	}

	/* 판매 내역 등록 */
	public void insertSale(SalesVO vo) {
		mybatis.insert("sales.insertSaleMaster", vo);
		mybatis.insert("sales.insertSaleDetail", vo);
	}
}