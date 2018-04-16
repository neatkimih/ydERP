package com.yedam.erp.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.sales.SalesVO;

@Repository
public class SalesMybatisDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/* 판매 내역 조회 (한 건) */
	public SalesVO getSale(SalesVO salesVO) {
		return mybatis.selectOne("sales.getSale", salesVO);
	}

	/* 판매 내역 조회 (전체 건) */
	public List<SalesVO> getSaleList(SalesVO salesVO) {
		return mybatis.selectList("sales.getSaleList", salesVO);
	}
	
	/* 판매 내역 검색 */
	public List<SalesVO> getSaleByCondition(SalesVO salesVO) {
		return mybatis.selectList("sales.getSaleByCondition", salesVO);
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
	
	/* 승인대기 주문 취소 */
	public void deleteOrder(SalesVO salesVO) {
		mybatis.delete("sales.deleteOrder", salesVO);
	}
	
	/* 승인대기 주문 검색 */
	public List<SalesVO> getOrderByCondition(SalesVO salesVO) {
		return mybatis.selectList("sales.getOrderByCondition", salesVO);
	}
	
	/* 배송 상태 Lookup 정보 가져오기 */
	public List<Map<String, Object>> getLookupDelivery(SalesVO salesVO) {
		return mybatis.selectList("sales.getLookupDelivery", salesVO);
	}
	
	/* 결제 상태 Lookup 정보 가져오기 */
	public List<Map<String, Object>> getLookupPayment(SalesVO salesVO) {
		return mybatis.selectList("sales.getLookupPayment", salesVO);
	}
}