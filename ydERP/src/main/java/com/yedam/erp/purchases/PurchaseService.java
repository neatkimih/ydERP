package com.yedam.erp.purchases;

public interface PurchaseService
{
	/* 판매 내역 조회 (단건) */
	public PurchaseVO selectOne(PurchaseVO purchaseVO);	
	
	/* 판매 내역 조회 (전체) */
	
	
	/* 판매 내역 등록 */
	public void insert(PurchaseVO purchaseVO);

	/* 판매 내역 수정 */
	public void update(PurchaseVO purchaseVO);
}