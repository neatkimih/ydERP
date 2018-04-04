package com.yedam.erp.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Controller
public class SalesController {

	@Autowired
	SalesService salesService;

	/* 전체 조회 폼 */
	@RequestMapping("/getSaleList")
	public String getSaleList(Model model, SalesVO vo) {
		model.addAttribute("saleList", salesService.getSaleList(vo));
		return "sales/getSaleList";
	}
	
	/* 등록 폼 */
	@RequestMapping("/insertSaleForm")
	public String insertSaleForm() {
		return "sales/insertSale";
	}

	/* 등록 처리 */
	@RequestMapping("/insertSale")
	public String insertSale(SalesVO vo) {
		salesService.insertSale(vo);
		return "redirect:/getSaleList";
	}
	
	/* 수정 처리 */

}