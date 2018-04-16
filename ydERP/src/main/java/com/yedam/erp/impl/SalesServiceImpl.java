package com.yedam.erp.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesMybatisDAO salesDAO;

	/* 판매 내역 조회 (한 건) */
	@Override	
	public SalesVO getSale(SalesVO salesVO) {
		return salesDAO.getSale(salesVO);
	}
	
	/* 판매 내역 조회 (전체 건) */
	@Override	
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return salesDAO.getSaleList(salesVO);
	}
	
	/* 판매 내역 검색 */
	@Override
	public List<SalesVO> getSaleByCondition(SalesVO salesVO) {
		return salesDAO.getSaleByCondition(salesVO);		
	}

	/* 승인대기 주문 기본 정보 조회 */
	@Override
	public List<SalesVO> getOrderList(SalesVO salesVO) {
		return salesDAO.getOrderList(salesVO);
	}
	
	/* 주문 승인 */
	@Override
	public void updateOrderStatus(SalesVO salesVO) {
		salesDAO.updateOrderStatus(salesVO);
	}

	/* 승인대기 주문취소 */
	@Override	
	public void deleteOrder(SalesVO salesVO) {
		salesDAO.deleteOrder(salesVO);
	}
	
	/* 승인대기 주문 내역 검색 */
	@Override
	public List<SalesVO> getOrderByCondition(SalesVO salesVO) {
		return salesDAO.getOrderByCondition(salesVO);
	}
}