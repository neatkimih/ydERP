package com.yedam.erp.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesMybatisDAO salesDAO;

	@Override
	/* 판매 내역 조회 (선택 단건) */
	public SalesVO getSale(SalesVO salesVO) {
		return salesDAO.getSale(salesVO);
	}
	
	@Override
	/* 판매 내역 조회 (전체 리스트) */
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return salesDAO.getSaleList(salesVO);
	}
	

	/* 미승인 주문 기본 정보 조회 */
	@Override
	public List<SalesVO> getOrderList(SalesVO salesVO) {
		return salesDAO.getOrderList(salesVO);
	}
	
	/* 주문 승인 */
	@Override
	public void updateOrderStatus(SalesVO salesVO) {
		salesDAO.updateOrderStatus(salesVO);
	}

	/* 미승인 주문 기본 정보 삭제 */
	@Override	
	public void deleteOrderList(ArrayList<String> saleCode) {
		salesDAO.deleteOrderList(saleCode);
	}
}