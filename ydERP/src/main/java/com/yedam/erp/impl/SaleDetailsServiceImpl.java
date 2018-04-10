package com.yedam.erp.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;

@Service
public class SaleDetailsServiceImpl implements SaleDetailsService {

	@Autowired
	private SaleDetailsMybatisDAO saleDetailsDAO;
	
	/* 판매 상세 정보 조회 */
	@Override
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getSaleDetail(saleDetailsVO);
	}
	
	/* 미승인 주문 상세 정보 조회 */
	@Override
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getOrderDetail(saleDetailsVO);	
	}
	
	/* 미승인 주문 상세 정보 삭제 */
	@Override	
	public void deleteOrderDetail(ArrayList<String> saleCode) {
		saleDetailsDAO.deleteOrderDetail(saleCode);
	}
}