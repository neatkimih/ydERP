package com.yedam.erp.purchases;

import java.util.List;

public interface PurchasesService
{
	/* 구매 내역 조회 (단건) */
	public PurchasesVO getPurchases(PurchasesVO vo);
	
	/* 구매 내역 조회 (전체) */
	public List<PurchasesVO> getPurchasesList(PurchasesVO vo);
	
	/* 구매 내역 등록 */
	public void insertPurchases(PurchasesVO purchasesVO);

	/* 구매 내역 수정 */
	public void updatePurchases(PurchasesVO purchasesVO);

	/* 구매 내역 수정 */
	public void deletePurchases(PurchasesVO purchasesVO);

}