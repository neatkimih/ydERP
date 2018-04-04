package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Service
public class SalesServiceImpl implements SalesService
{
	@Autowired
	private SalesMybatisDAO salesDAO;

	@Override
	public SalesVO selectOne(SalesVO vo) {
		return salesDAO.selectOne(vo);
	}

	@Override
	public void insert(SalesVO vo) {
		salesDAO.insert(vo);
	}

	@Override
	public void update(SalesVO vo) {
		salesDAO.update(vo);
	}

	@Override
	public List<SalesVO> selectAll(SalesVO vo) {
		
		return null;
	}
}