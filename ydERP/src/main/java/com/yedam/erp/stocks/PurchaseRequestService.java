package com.yedam.erp.stocks;

import java.util.List;
import java.util.Map;

public interface PurchaseRequestService {

	public List<PurchaseRequestVO> getPurchaseRequestList(PurchaseRequestVO vo);

	public List<PurchaseDetailTempVO> getPurchaseRequestTempList(PurchaseDetailTempVO vo);

	public void insertPurchaseRequestTemp(List<PurchaseDetailTempVO> volist);

	public void insertPurchaseRequest();
	
	public List<Map<String, Object>> getlookUpValueList();

}
