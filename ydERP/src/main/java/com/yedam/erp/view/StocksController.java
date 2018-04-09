package com.yedam.erp.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.stocks.PurchaseRequestService;
import com.yedam.erp.stocks.PurchaseRequestVO;
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

	@Autowired
	PurchaseRequestService purchaseRequestService;

	@RequestMapping("getStockInOutList")
	public String getStockInOutList(Model model, StockInOutVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockInOutList";
	}

	@RequestMapping("getStockInOutListData")
	@ResponseBody
	public List<StockInOutViewVO> getStocksListData(StockInOutVO vo) {
		return stockInOutService.getStockInOutList(vo);
	}

	@RequestMapping("getItemInOutList")
	public String getItemInOutList(Model model, StockInOutVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getItemInOutList";
	}

	@RequestMapping("getItemInOutListData")
	@ResponseBody
	public List<StockInOutViewVO> getItemInOutListData(StockInOutVO vo) {
		return stockInOutService.getItemInOutList(vo);
	}

	@RequestMapping("getStockOnhandList")
	public String getStockOnhandList(Model model, StockOnhandVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockOnhandList";
	}

	@RequestMapping("getStockOnhandList2")
	public String getStockOnhandList2(Model model, StockOnhandVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getStockOnhandList2";
	}

	@RequestMapping("getStockOnhandListData")
	@ResponseBody
	public List<StockOnhandViewVO> getStockOnhandListData(StockOnhandVO vo) {
		return stockOnhandService.getStockOnhandList(vo);

	}

	@RequestMapping("getPurchaseRequestList")
	public String getPurchaseRequestList(Model model, PurchaseRequestVO vo) {
		model.addAttribute("list", vo);
		return "stocks/getPurchaseRequestList";
	}

	@RequestMapping("getPurchaseRequestListData")
	@ResponseBody
	public List<PurchaseRequestVO> getPurchaseRequestListData(PurchaseRequestVO vo) {
		return purchaseRequestService.getPurchaseReqeustList(vo);
	}

	@RequestMapping("getStockInOutListTest")
	public String getStockInOutListTest(StockInOutVO vo) {
		return "stocks/jqgridTest";
	}

	@RequestMapping("insertPurchaseRequest")
	public String insertPurchaseRequest(PurchaseRequestVO vo) {
		purchaseRequestService.insertPurchaseRequest(vo);
		return "stocks/getPurchaseRequesting";
	}

}
