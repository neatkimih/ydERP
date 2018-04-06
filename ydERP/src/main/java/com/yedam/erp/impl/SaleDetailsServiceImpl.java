package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;

@Service
public class SaleDetailsServiceImpl implements SaleDetailsService {

	@Autowired
	private SaleDetailsMybatisDAO saleDetailsDAO;
	
	/* 판매 상세 조회 (전체 리스트) */
	@Override
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO) {
		return saleDetailsDAO.getSaleDetail(saleDetailsVO);
	}
}