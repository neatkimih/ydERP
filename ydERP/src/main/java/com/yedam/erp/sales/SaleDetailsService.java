package com.yedam.erp.sales;

import java.util.List;

public interface SaleDetailsService {
	/* 판매 상세 정보 조회 */
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO);
	
	/* 미승인 주문 상세 정보 조회 */
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO);
}