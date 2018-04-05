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
	/* 판매 내역 조회 (선택 단건) */
	public SalesVO getSale(SalesVO salesVO) {
		return salesDAO.getSale(salesVO);
	}
	
	@Override
	/* 판매 내역 조회 (전체 리스트) */
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return salesDAO.getSaleList(salesVO);
	}
	
	@Override
	/* 판매 내역 등록 */
	public void insertSale(SalesVO salesVO) {
		salesDAO.insertSale(salesVO);
	}

	@Override
	/* 판매 내역 수정 */
	public void updateSale(SalesVO salesVO) {
		salesDAO.updateSale(salesVO);
	}

	@Override
	/* 판매 내역 삭제 */
	public void deleteSale(SalesVO salesVO) {
		salesDAO.deleteSale(salesVO);
	}
}