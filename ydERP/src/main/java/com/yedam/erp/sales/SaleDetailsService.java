package com.yedam.erp.sales;

import java.util.List;

public interface SaleDetailsService {
	/* 판매 상세 조회 (전체 리스트) */
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO);
}
