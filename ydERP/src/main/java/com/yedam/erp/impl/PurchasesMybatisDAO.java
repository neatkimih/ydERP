package com.yedam.erp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.purchases.PurchasesVO;

@Repository
public class PurchasesMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public void insertPurchases(PurchasesVO vo){
		sqlSession.insert("purchases.insertPurchases", vo);
	}
	public void updatePurchases(PurchasesVO vo){
		sqlSession.update("purchases.updatePurchases", vo);
	}
	public void deletePurchases(PurchasesVO vo){
		sqlSession.delete("purchases.deletePurchases", vo);
	}
	public PurchasesVO getPurchases(PurchasesVO vo){
		System.out.println("mybatis getPurchases");
		return sqlSession.selectOne("purchases.getPurchases", vo);
	
	}
	public List<PurchasesVO> getPurchasesList(PurchasesVO vo){
		System.out.println("mybatis getPurchasesList");
		return sqlSession.selectList("purchases.getPurchasesList", vo); 
	}	
	
}
