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

	/* 주문 기본 정보 등록 */
	// public void insertOrder(SalesVO salesVO);
	
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
	
	/* 배송 상태 Lookup 정보 가져오기 */
	public List<Map<String, Object>> getLookupDelivery(SalesVO salesVO);
	
	/* 결제 상태 Lookup 정보 가져오기 */
	public List<Map<String, Object>> getLookupPayment(SalesVO salesVO);
}