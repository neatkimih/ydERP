package com.yedam.erp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.sales.SalesVO;

@Repository
public class SalesMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/* 판매 내역 조회 (선택 단건) */
	public SalesVO getSale(SalesVO salesVO) {
		return mybatis.selectOne("sales.getSale", salesVO);
	}

	/* 판매 내역 조회 (전체 리스트) */
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return mybatis.selectList("sales.getSaleList", salesVO);
	}
	
	/* 판매 내역 등록 */
	public void insertSale(SalesVO salesVO) {
		mybatis.insert("sales.insertSale", salesVO);
		// mybatis.insert("sales.insertSaleMaster", salesVO);
		// mybatis.insert("sales.insertSaleDetail", salesVO);
	}

	/* 판매 내역 수정 */
	public void updateSale(SalesVO salesVO) {
		mybatis.update("sales.updateSale", salesVO);
	}
	
	/* 승인대기 주문 기본 정보 조회 */
	public List<SalesVO> getOrderList(SalesVO salesVO) {
		return mybatis.selectList("sales.getOrderList", salesVO);
	}
	
	/* 주문 승인 */
	public void updateOrderStatus(SalesVO salesVO) {
		mybatis.update("sales.updateOrderStatus", salesVO);
	}
	
	
	/* 승인대기 주문취소 */
	public void deleteOrder(SalesVO salesVO) {
		mybatis.delete("sales.deleteOrder", salesVO);
	}
}