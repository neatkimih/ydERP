package com.yedam.erp.view;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.common.Paging;
import com.yedam.erp.employees.EmployeesService;
import com.yedam.erp.employees.EmployeesVO;
import com.yedam.erp.sales.SaleDetailsService;
import com.yedam.erp.sales.SaleDetailsVO;
import com.yedam.erp.sales.SalesService;
import com.yedam.erp.sales.SalesVO;
import com.yedam.erp.stocks.PurchaseRequestService;
import com.yedam.erp.stocks.PurchaseRequestVO;

@Controller
public class SalesController {

	@Autowired SalesService salesService;
	@Autowired SaleDetailsService saleDetailsService;
	@Autowired EmployeesService employeesService;
	@Autowired PurchaseRequestService purchaseRequestService;

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
		System.out.println(saleDetailsVO.getSaleCode());
		return saleDetailsService.getSaleDetail(saleDetailsVO);
	}
	
	/* 판매 내역 검색 처리 */
	@RequestMapping("/getSaleByCondition.do")
	@ResponseBody
	public List<SalesVO> getSaleByCondition(SalesVO salesVO) {
		return salesService.getSaleByCondition(salesVO);
	}

	/* 주문 등록 페이지 폼 */
	@RequestMapping("/insertOrder")
	public String insertOrderForm() {
		return "sales/insertOrder";
	}

	/* 승인대기 주문 내역 페이지 폼 */
	@RequestMapping("/getOrderList")
	public String getOrderListForm(Model model, EmployeesVO employeesVO, PurchaseRequestVO vo) {
		
		List<EmployeesVO> empList = employeesService.getEmployeesList(employeesVO);
		List<Map<String, Object>> lookupList = purchaseRequestService.getlookUpValueList(vo);
		
		
		
		String lookupStr = "";
		String empStr = "";
		EmployeesVO empNext = null;
		
		Iterator<EmployeesVO> iterator = empList.iterator();
		while (iterator.hasNext()) {
		    // empStr += iterator.next().getId() + ":" + iterator.next().getName() + ";";
			empNext = iterator.next();
			empStr += empNext.getId() + ":" + empNext.getName() + ";";
		}
		System.out.println(empStr);
		model.addAttribute("employeeList", empStr);

		for (Map<String, Object> lookup : lookupList) {
			// "FE:FedEx; IN:InTime; TN:TNT; AR:ARAMEX"
			lookupStr += lookup.get("LOOKUP_CODE") + ":" + lookup.get("LOOKUP_VALUES") + ";";
		}
		System.out.println(lookupStr);
		model.addAttribute("lookupValueList", lookupStr);
		return "sales/getOrderList";
	}

	/* 승인대기 주문 기본 정보 조회 */
	@RequestMapping("/getOrderList.do")
	@ResponseBody
	public List<SalesVO> getOrderList(SalesVO salesVO, Paging page) {
		return salesService.getOrderList(salesVO);
	}

	/* 승인대기 주문 상세 정보 조회 */
	@RequestMapping(value = "/getOrderDetail.do")
	@ResponseBody
	public List<SaleDetailsVO> getOrderDetail(SaleDetailsVO saleDetailsVO, Paging page) {
		if(saleDetailsVO.getSaleCode() != null && !saleDetailsVO.getSaleCode().equals("")) {
		return saleDetailsService.getOrderDetail(saleDetailsVO);
		}
		return null;
	}

	/* 주문 승인 처리 */
	/*@RequestMapping(value = "/updateOrderStatus.do")
	@ResponseBody
	public String updateOrderStatus(SalesVO salesVO) {
		salesService.updateOrderStatus(salesVO);
		return "redirect:/getOrderList";
	}*/

	/* 승인대기 주문취소 처리 */
	@RequestMapping("/deleteOrderList.do")
	@ResponseBody
	public String deleteOrderList(SalesVO salesVO) {
		salesService.deleteOrder(salesVO);
		return "redirect:/getOrderList";
	}
	
	/* 승인대기 주문 검색 처리*/
	@RequestMapping("/getOrderByCondition.do")
	@ResponseBody
	public List<SalesVO> getOrderByCondition(SalesVO salesVO) {
		return salesService.getOrderByCondition(salesVO);
	}
	

	/* 승인대기 주문 그리드 편집 */
	@RequestMapping("/editOrderList.do")
	@ResponseBody
	public void editOrderList(@RequestParam(value = "oper", required = false) String op, SalesVO salesVO) {
		System.out.println("sdafasfda");
		if (op.equals("edit")) {
			salesService.updateOrderStatus(salesVO);
		} else if (op.equals("del")) {
			salesService.deleteOrder(salesVO);
		}
	}

}