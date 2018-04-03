package com.yedam.erp.purchases;

public interface PurchasesService
{
	/* 판매 내역 조회 (단건) */
	public PurchasesVO selectOne(PurchasesVO purchasesVO);	
	
	/* 판매 내역 조회 (전체) */
	
	
	/* 판매 내역 등록 */
	public void insert(PurchasesVO purchasesVO);

	/* 판매 내역 수정 */
	public void update(PurchasesVO purchasesVO);
}