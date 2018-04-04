package com.yedam.erp.sales;

import com.yedam.erp.sales.SalesVO;

public interface SalesService
{
	/* 판매 내역 조회 (단건) */
	public SalesVO selectOne(SalesVO vo);
}