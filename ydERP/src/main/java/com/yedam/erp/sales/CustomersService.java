package com.yedam.erp.sales;

import java.util.List;

public interface CustomersService {
	/* 판매처 전체 조회 */
	public List<CustomersVO> getCustomerList(CustomersVO vo);

	/* 판매처 등록 */
	public void insertCustomer(CustomersVO vo);
}
