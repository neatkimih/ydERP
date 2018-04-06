package com.yedam.erp.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.stocks.StockInOutService;
import com.yedam.erp.stocks.StockInOutVO;
import com.yedam.erp.stocks.StockInOutViewVO;
import com.yedam.erp.stocks.StockOnhandService;
import com.yedam.erp.stocks.StockOnhandVO;
import com.yedam.erp.stocks.StockOnhandViewVO;

@Controller
public class StocksController {

	@Autowired
	StockInOutService stockInOutService;

	@Autowired
	StockOnhandService stockOnhandService;

	@RequestMapping("getStockInOutList")
	public String getStocksList(Model model, StockInOutVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockInOutList";
	}

	@RequestMapping("getStockInOutListData")
	@ResponseBody
	public List<StockInOutViewVO> getStocksListData(StockInOutVO vo) {
		return stockInOutService.getStockInOutList(vo);

	}
	
	@RequestMapping("getStockOnhandList")
	public String getStockOnhandList(Model model, StockOnhandVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockOnhandList";
	}

	@RequestMapping("getStockOnhandListData")
	@ResponseBody
	public List<StockOnhandViewVO> getStockOnhandListData(StockOnhandVO vo) {
		return stockOnhandService.getStockOnhandList(vo);

	}
	

}
