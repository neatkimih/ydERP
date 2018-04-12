package com.yedam.erp.stocks;

import java.util.List;

public interface StockOnhandService {

	public List<StockOnhandViewVO> getStockOnhandList(StockOnhandViewVO vo);

	public List<StockOnhandViewVO> getVendorList(StockOnhandViewVO vo);
}
