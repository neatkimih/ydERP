package com.yedam.erp.sales;

import java.util.List;

public interface VendorsService {
	/* 판매처 전체 조회 */
	public List<VendorsVO> getVendorList(VendorsVO vo);

	/* 판매처 등록 */
	public void insertVendor(VendorsVO vo);
}
