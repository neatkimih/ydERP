package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.purchases.PurchasesService;
import com.yedam.erp.purchases.PurchasesVO;

@Service
public class PurchasesServiceImpl implements PurchasesService
{
	@Autowired
	PurchasesMybatisDAO dao;

	@Override
	public void insertPurchases(PurchasesVO purchasesVO) {
		// TODO Auto-generated method stub
		
	}	

	@Override
	public void updatePurchases(PurchasesVO purchasesVO) {
		dao.updatePurchases(purchasesVO);
		
	}


	@Override
	public void deletePurchases(PurchasesVO purchasesVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PurchasesVO getPurchases(PurchasesVO vo) {
		// TODO Auto-generated method stub
		return dao.getPurchases(vo);
	}
	
	@Override
	public List<PurchasesVO> getPurchasesList(PurchasesVO vo) {
		
		return dao.getPurchasesList(vo);
	}		

	
}