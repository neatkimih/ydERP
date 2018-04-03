package com.yedam.erp.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.PurchasesService;
import com.yedam.erp.PurchasesVO;

@Service
public class PurchasesServiceImpl implements PurchasesService
{
	@Autowired
	private PurchasesDAO purchasesDAO;

	@Override
	public PurchasesVO selectOne(PurchasesVO vo) {
		return purchasesDAO.selectOne(vo);
	}

	@Override
	public void insert(PurchasesVO vo) {
		purchasesDAO.insert(vo);
	}

	@Override
	public void update(PurchasesVO vo) {
		purchasesDAO.update(vo);
	}
}