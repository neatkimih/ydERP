package com.yedam.erp.sales;

import java.util.List;
import com.yedam.erp.sales.SalesVO;

public interface SalesService {
	
	/* 판매 내역 조회 (선택 단건) */
	public SalesVO getSale(SalesVO salesVO);
	
	/* 판매 내역 조회 (전체 리스트) */
	public List<SalesVO> getSaleList(SalesVO salesVO);

	/* 판매 내역 등록 */
	public void insertSale(SalesVO salesVO);
	
	/* 판매 내역 수정 */
	public void updateSale(SalesVO salesVO);
	
	/* 판매 내역 삭제 */
	public void deleteSale(SalesVO salesVO);
}