package com.yedam.erp.sales;

import java.util.List;
import com.yedam.erp.sales.SalesVO;

public interface SalesService {
	
	/* 판매 내역 조회 (선택 단건) */
	public SalesVO getSale(SalesVO salesVO);
	
	/* 판매 내역 조회 (전체 리스트) */
	public List<SalesVO> getSaleList(SalesVO salesVO);

	/* 주문 기본 정보 등록 */
	// public void insertOrder(SalesVO salesVO);
	
	/* 주문 수정 */
	// public void updateSale(SalesVO salesVO);
	
	
	/* 미승인 주문 기본 정보 조회 */
	public List<SalesVO> getOrderList(SalesVO salesVO);
	
	/* 주문 승인 */
	public void updateOrderStatus(SalesVO salesVO);	
	
	/* 승인대기 주문취소 */
	public void deleteOrder(SalesVO salesVO);
}