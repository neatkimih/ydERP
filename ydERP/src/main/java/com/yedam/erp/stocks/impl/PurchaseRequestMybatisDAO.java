package com.yedam.erp.stocks.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.PurchaseDetailTempVO;
import com.yedam.erp.stocks.PurchaseRequestVO;

@Repository
public class PurchaseRequestMybatisDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo) {
		return sqlSession.selectList("stocks.getPurchaseRequestList", vo);
	}

	public void insertPurchaseRequest() {
		sqlSession.insert("stocks.insertPurchaseRequest");
	}

	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo) {
		return sqlSession.selectList("stocks.getPurchaseRequestTempListData", vo);
	}

	public void insertPurchaseRequestTemp(PurchaseDetailTempVO vo) {
		sqlSession.insert("stocks.insertPurchaseRequestTemp", vo);
	}

}
