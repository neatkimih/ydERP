package com.yedam.erp.sales;

import java.util.List;

import com.yedam.erp.sales.SalesVO;

public interface SalesService
{
	/* 판매 내역 리스트 조회 */
	public List<SalesVO> getSaleList(SalesVO vo);
	
	/* 판매 내역 등록 */
	public void insertSale(SalesVO vo);
}