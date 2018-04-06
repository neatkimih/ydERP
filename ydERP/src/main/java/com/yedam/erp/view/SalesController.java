package com.yedam.erp.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.common.Paging;
import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Controller
public class SalesController {

	@Autowired
	SalesService salesService;
	
	@Autowired
	SaleDetailsService saleDetailsService;

	/* 전체 판매 내역 페이지 */
	@RequestMapping("/getSaleList")
	public String getSaleListForm() {
		return "sales/getSaleList";
	}

	/* 전체 판매 내역 조회 */
	@RequestMapping("/getSaleList.do")
	@ResponseBody
	public List<SalesVO> getSaleList(SalesVO salesVO, Paging page) {
		return salesService.getSaleList(salesVO);
	}
	
	/* 상세 판매 내역 조회 */
	@RequestMapping("/getSaleDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		return saleDetailsService.getSaleDetail(saleDetailsVO);
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