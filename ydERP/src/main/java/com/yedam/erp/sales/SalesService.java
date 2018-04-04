package com.yedam.erp.sales;

import java.util.List;

import com.yedam.erp.sales.SalesVO;

public interface SalesService
{
	/* 판매 내역 조회 (단건) */
	public SalesVO selectOne(SalesVO vo);
	
	/* 판매 내역 조회 (전체) */
	public List<SalesVO> selectAll(SalesVO vo);
	
	/* 판매 내역 등록 - 주문 등록 */
	public void insert(SalesVO vo);

	/* 판매 내역 수정 */
	public void update(SalesVO vo);
}