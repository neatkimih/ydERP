package com.yedam.erp.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.stocks.StockOnhandViewVO;
import com.yedam.erp.stocks.StockOnhandsVO;
import com.yedam.erp.stocks.StocksInOutVO;
import com.yedam.erp.stocks.StocksService;
import com.yedam.erp.stocks.StocksVO;

@Controller
public class StocksController {

	@Autowired
	StocksService stocksService;

	@RequestMapping("getStocksList")
	public String getStocksList(Model model, StocksVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStocksList";
	}

	@RequestMapping("getStocksListData")
	@ResponseBody
	public List<StocksInOutVO> getStocksListData(StocksVO vo) {
		return stocksService.getStocksList(vo);

	}
	
	@RequestMapping("getStockOnhandList")
	public String getStockOnhandList(Model model, StockOnhandsVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockOnhandList";
	}

	@RequestMapping("getStockOnhandListData")
	@ResponseBody
	public List<StockOnhandViewVO> getStockOnhandListData(StockOnhandsVO vo) {
		return stocksService.getStockOnhandsList(vo);

	}
	

}
