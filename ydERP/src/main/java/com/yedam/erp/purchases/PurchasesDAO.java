package com.yedam.erp.purchases;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchasesDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/* 판매 내역 조회 SQL 처리 (단건) */
	public PurchasesVO selectOne(PurchasesVO vo)
	{
		return mybatis.selectOne("Purchases.selectOne", vo);
	}
	
	/* 판매 내역 조회 SQL 처리 (전체) */
	
	
	
	
	
	/* 판매 내역 등록 SQL 처리 */
	public void insert(PurchasesVO vo)
	{
		mybatis.insert("PurchasesDAO.insert", vo);
	}
	
	public void update(PurchasesVO vo)
	{
		mybatis.update("PurchasesDAO.update", vo);
	}
}