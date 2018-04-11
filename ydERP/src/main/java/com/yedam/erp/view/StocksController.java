package com.yedam.erp.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.stocks.PurchaseDetailTempVO;
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

	@RequestMapping(value = "getPurchaseRequestListData_jqgrid", method = RequestMethod.GET)
	@ResponseBody
	public List<PurchaseRequestVO> getPurchaseRequestListData_jqgrid(PurchaseRequestVO vo) {
		return purchaseRequestService.getPurchaseRequestList(vo);
	}

	@RequestMapping(value = "/getPurchaseRequestListData", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPurchaseRequestListData(PurchaseRequestVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<PurchaseRequestVO> requestlist = purchaseRequestService.getPurchaseRequestList(vo);
		map.put("data", requestlist);
		return map;
	}

	@RequestMapping("/getPurchaseRequestList")
	public String getPurchaseRequestList() {
		return "stocks/getPurchaseRequestList";
	}

	@RequestMapping("getStockInOutListTest")
	public String getStockInOutListTest(StockInOutVO vo) {
		return "stocks/jqgridTest";
	}

	@RequestMapping("insertPurchaseRequestTemp")
	@ResponseBody
	public Map<String, String> insertPurchaseRequestTemp(@RequestBody List<PurchaseDetailTempVO> vo) {
		purchaseRequestService.insertPurchaseRequestTemp(vo);
		Map<String, String> map = new HashMap<String, String>();
		return map;
	}

	// getPurchaseRequestTempListData
	@RequestMapping(value = "/getPurchaseRequestTempListData", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPurchaseRequestTempListData(PurchaseDetailTempVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<PurchaseDetailTempVO> requestlist = purchaseRequestService.getPurchaseRequestTempList(vo);
		map.put("data", requestlist);
		return map;
	}

	@RequestMapping("getPurchaseRequesting")
	public String getPurchaseRequesting(Model model) {
		System.out.println(purchaseRequestService.getlookUpValueList());
		model.addAttribute("lookUpValue", purchaseRequestService.getlookUpValueList());
		return "stocks/getPurchaseRequesting";
	}

	@RequestMapping("insertPurchaseRequest")
	@ResponseBody
	public Map<String, String> insertPurchaseRequest() {
		purchaseRequestService.insertPurchaseRequest();
		Map<String, String> map = new HashMap<String, String>();
		return map;
	}

}
