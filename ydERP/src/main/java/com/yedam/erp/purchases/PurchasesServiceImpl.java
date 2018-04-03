package com.yedam.erp.purchases;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchasesServiceImpl implements PurchasesService
{
	@Autowired
	private PurchasesDAO purchasesDAO;

	@Override
	public PurchasesVO selectOne(PurchasesVO purchasesVO) {
		return null;
	}

	@Override
	public void insert(PurchasesVO purchasesVO) {
		
		
	}

	@Override
	public void update(PurchasesVO purchasesVO) {
		// TODO 자동 생성된 메소드 스텁
		
	}
	

}