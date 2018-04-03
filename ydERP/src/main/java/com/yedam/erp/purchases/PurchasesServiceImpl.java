package com.yedam.erp.purchases;

import org.springframework.stereotype.Service;

public class PurchasesServiceImpl implements PurchasesService
{
	@Service
	private PurchaseDAO purchaseDAO;

	@Override
	public PurchasesVO selectOne(PurchasesVO purchaseVO) {
		return null;
	}

	@Override
	public void insert(PurchasesVO purchaseVO) {
		
		
	}

	@Override
	public void update(PurchasesVO purchaseVO) {
		// TODO 자동 생성된 메소드 스텁
		
	}
	

}