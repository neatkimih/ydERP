package com.yedam.erp.sales;

import java.util.List;
import java.util.Map;

import com.yedam.erp.sales.SalesVO;

public interface SalesService {
	
	/* 판매 내역 조회 (한 건) */
	public SalesVO getSale(SalesVO salesVO);
	
	/* 판매 내역 조회 (전체 건) */
	public List<SalesVO> getSaleList(SalesVO salesVO);
	
	/* 판매 내역 검색 */
	public List<SalesVO> getSaleByCondition(SalesVO salesVO);

	/* 주문 수정 */
	// public void updateSale(SalesVO salesVO);
	
	
	/* 승인대기 주문 기본 정보 조회 */
	public List<SalesVO> getOrderList(SalesVO salesVO);
	
	/* 주문 승인 */
	public void updateOrderStatus(SalesVO salesVO);	
	
	/* 승인대기 주문취소 */
	public void deleteOrder(SalesVO salesVO);
	
	/* 승인대기 주문 내역 검색 */
	public List<SalesVO> getOrderByCondition(SalesVO salesVO);
	
	/* 승인 후 품목 재고 처리 */
	public void afterPermitOrder(String saleCode);
	
	/* 월일별 판매액 통계 처리 */
	public List<Map<String, Object>> getSaleChart(SalesVO salesVO);
	
	/* 월일별 순이익 통계 처리 */
	public List<Map<String, Object>> getProfitChart(SalesVO salesVO);
}