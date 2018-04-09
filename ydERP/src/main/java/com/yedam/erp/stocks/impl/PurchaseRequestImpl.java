package com.yedam.erp.stocks.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.PurchaseRequestVO;
import com.yedam.erp.stocks.PurchaseRequestService;

@Service
public class PurchaseRequestImpl implements PurchaseRequestService {

	@Autowired
	PurchaseRequestMybatisDAO dao;

	@Override
	public List<PurchaseRequestVO> getPurchaseReqeustList(PurchaseRequestVO vo) {
		return dao.getPurchaseReqeustList(vo);
	}

	@Override
	public void insertPurchaseRequest(PurchaseRequestVO vo) {
		dao.insertPurchaseRequest(vo);		
	}

}
