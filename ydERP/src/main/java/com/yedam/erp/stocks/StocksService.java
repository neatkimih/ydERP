package com.yedam.erp.stocks;

import java.util.List;

public interface StocksService {

	public List<StocksInOutVO> getStocksList(StocksVO vo);

	public List<StockOnhandViewVO> getStockOnhandsList(StockOnhandsVO vo);

}
