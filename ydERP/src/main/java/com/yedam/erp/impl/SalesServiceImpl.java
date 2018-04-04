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

	@Override
	public List<SalesVO> getSaleList(SalesVO vo) {
		return salesDAO.getSaleList(vo);
	}
}