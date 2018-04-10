package com.yedam.erp.stocks.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.stocks.PurchaseRequestVO;
import com.yedam.erp.stocks.PurchaseDetailTempVO;
import com.yedam.erp.stocks.PurchaseRequestService;

@Service
public class PurchaseRequestImpl implements PurchaseRequestService {

	@Autowired
	PurchaseRequestMybatisDAO dao;

	@Override
	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo) {
		return dao.getPurchaseRequestList(vo);
	}

	@Override
	public void insertPurchaseRequest() {
			dao.insertPurchaseRequest();
	}

	@Override
	public void insertPurchaseRequestTemp(List<PurchaseDetailTempVO> volist) {
		for (PurchaseDetailTempVO vo : volist)
			dao.insertPurchaseRequestTemp(vo);
	}

	@Override
	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo) {
		// TODO Auto-generated method stub
		return dao.getPurchaseRequestTempList(vo);
	}

}
