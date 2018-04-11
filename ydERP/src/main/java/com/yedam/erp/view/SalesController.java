package com.yedam.erp.view;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.common.LookupValuesService;
import com.yedam.erp.common.LookupValuesVO;
import com.yedam.erp.common.Paging;
import com.yedam.erp.employees.EmployeesService;
import com.yedam.erp.employees.EmployeesVO;
import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;

@Controller
public class SalesController {

	@Autowired SalesService salesService;
	@Autowired SaleDetailsService saleDetailsService;
	@Autowired EmployeesService employeesService;
	@Autowired LookupValuesService lookupValuesService;

	/* 판매 내역 페이지 폼 */
	@RequestMapping("/getSaleList")
	public String getSaleListForm() {
		return "sales/getSaleList";
	}

	/* 전체 판매 내역 조회 처리 */
	@RequestMapping("/getSaleList.do")
	@ResponseBody
	public List<SalesVO> getSaleList(SalesVO salesVO, Paging page) {
		return salesService.getSaleList(salesVO);
	}

	/* 상세 판매 내역 조회 처리 */
	@RequestMapping(value = "/getSaleDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getSaleDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		return saleDetailsService.getSaleDetail(saleDetailsVO);
	}

	/* 주문 등록 페이지 폼 */
	@RequestMapping("/insertOrder")
	public String insertOrderForm() {
		return "sales/insertOrder";
	}
	
	/* 미승인 주문 내역 페이지 폼 */
	@RequestMapping("/getOrderList")
	public String getOrderListForm(Model model, EmployeesVO employeesVO, LookupValuesVO lookupValuesVO) {
		model.addAttribute("employeeList", employeesService.getEmployeesList(employeesVO));
		model.addAttribute("lookupValueList", lookupValuesService.getLookupValuesList(lookupValuesVO));
		return "sales/getOrderList";
	}
	
	/* 미승인 주문 기본 정보 조회 */
	@RequestMapping("/getOrderList.do")
	@ResponseBody
	public List<SalesVO> getOrderList(SalesVO salesVO, Paging page) {
		return salesService.getOrderList(salesVO);
	}

	/* 미승인 주문 상세 정보 조회 */
	@RequestMapping(value = "/getOrderDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		return saleDetailsService.getOrderDetail(saleDetailsVO);
	}

	/* 주문 승인 처리 */
	@RequestMapping("/updateOrderStatus.do")
	public String updateOrderStatus(SalesVO salesVO) {
		salesService.updateOrderStatus(salesVO);
		return "redirect:/getOrderList";
	}

	/* 미승인 주문 삭제 처리 */
	@RequestMapping("/deleteOrderList.do")
	public String deleteOrderList(@RequestParam ArrayList<String> saleCode) {
		saleDetailsService.deleteOrderDetail(saleCode);
		salesService.deleteOrderList(saleCode);
		return "redirect:/getOrderList";
	}
	
	/* 미승인 주문 그리드 편집 */
	@RequestMapping("/editOrderList.do")
	@ResponseBody
	public void editOrderList(	@RequestParam(value = "oper", required = false) String op, SalesVO salesVO) {
		if (op.equals("edit")) {
			salesService.updateOrderStatus(salesVO);
		}
		else if (op.equals("del")) {
					// itesService.deleteItems(vo);
		}
	}

}