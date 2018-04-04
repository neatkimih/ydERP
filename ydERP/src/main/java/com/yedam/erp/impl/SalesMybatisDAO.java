package com.yedam.erp.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.sales.SalesVO;

@Repository
public class SalesMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/* 판매 내역 조회 SQL 처리 (단건) */
	public SalesVO selectOne(SalesVO vo)
	{
		return mybatis.selectOne("Sales.selectOne", vo);
	}
}