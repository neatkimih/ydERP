package com.yedam.erp.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.erp.items.ItemsVO;
import com.yedam.erp.items.VendorService;
import com.yedam.erp.items.VendorVO;
import com.yedam.erp.items.Sales_tempService;
import com.yedam.erp.items.Sales_tempVO;
import com.yedam.erp.items.CustomerService;
import com.yedam.erp.items.CustomerVO;
import com.yedam.erp.items.ItemsService;

@Controller
public class ItemsController {

	@Autowired
	ItemsService itemsService;

	@Autowired
	VendorService vendorService;

	@Autowired
	CustomerService customerService;

	@Autowired
	Sales_tempService sales_tempService;

	// 품목 등록 폼
	@RequestMapping("/insertItemsForm")
	public String insertItemsForm() {
		return "items/getitemsList";
	}

	// 품목 등록 처리
	@RequestMapping("/insertItems")
	public String insertItems(ItemsVO vo) {
		itemsService.insertItems(vo);
		return "items/getitemsList";
	}

	// 품목 수정폼
	@RequestMapping("/updateItemsForm")
	public String updateItemsForm(Model model, ItemsVO vo) {

		model.addAttribute("Items", itemsService.getItems(vo));
		return "items/getitemsList";
	}

	// 품목 수정처리
	@RequestMapping("/updateItems")
	public String updateItems(ItemsVO vo) {
		itemsService.updateItems(vo);
		return "items/getitemsList";

	}

	// 품목 삭제처리
	@RequestMapping("/deleteItems")
	public String deleteItems(ItemsVO vo) {
		itemsService.deleteItems(vo);
		return "items/getitemsList";
	}

	// 품목 전체 조회 폼
	@RequestMapping("/getItemsList")
	public String getItemsList() {
		return "items/getitemsList";
	}

	// 품목 전체 조회 처리
	@RequestMapping("/getItemsList.do")
	@ResponseBody
	public List<ItemsVO> getItemsListGridData(Model model, ItemsVO vo) {
		vo.setFirst(1);
		vo.setLast(30);
		return itemsService.getItemsList(vo);
	}

	// 품목 추가, 수정, 삭제 기능
	@RequestMapping("/getItemsDataEdit")
	@ResponseBody
	public void getItemsDataEdit(@RequestParam(value = "oper", defaultValue = "", required = false) String oper,
			ItemsVO vo, @RequestParam(value = "itemCode", defaultValue = "", required = false) String itemCode) {
		System.out.println(vo);
		if (oper.equals("add")) {
			itemsService.insertItems(vo);
		} else if (oper.equals("edit")) {
			itemsService.updateItems(vo);
		} else if (oper.equals("del")) {
			itemsService.deleteItems(vo);
			System.out.println(itemCode);
			if (itemCode.length() > 0) {
				for (String i : itemCode.split(",")) {
					vo.setItemCode(i);
					itemsService.deleteItems(vo);
				}
			}
		}
	}
	// <!-- 품목 (Items)의 끝 -->

	// 여기서부터 구매업체(Vendor) 관리
	// 구매 업체 관리폼
	@RequestMapping("/manageVendorForm")
	public String manageVendor(VendorVO vo) {
		return "items/manageVendor";
	}

	// 구매 업체 한건 조회 (onselectedRow)
	@RequestMapping("/getVendor")
	public VendorVO getVendor(VendorVO vo) {

		return vendorService.getVendor(vo);
	}

	// 구매 업체 목록 가져오기
	@RequestMapping("/getVendorList")
	@ResponseBody
	public List<VendorVO> getVendorList(Model model, VendorVO vo) {
		vo.setFirst(1);
		vo.setLast(30);
		return vendorService.getVendorList(vo);
	}

	// 구매 업체 등록
	@RequestMapping("/insertVendor")
	public String insertVendor(VendorVO vo) {
		vendorService.insertVendor(vo);
		return "items/manageVendor";
	}

	// 구매 업체 수정처리
	@RequestMapping("/updateVendor")
	public String updateVendor(VendorVO vo) {
		vendorService.updateVendor(vo);
		return "items/manageVendor";
	}

	// 구매 업체 여러건 삭제 (거래중단으로 update)
	@RequestMapping("/VendorEdit")
	@ResponseBody
	public void deleteVendor(@RequestParam(value = "oper", defaultValue = "", required = false) String oper,
			VendorVO vo, @RequestParam(value = "vendorCode", defaultValue = "", required = false) String vendorCode) {
		if (oper.equals("del")) {
			vendorService.deleteVendor(vo);
			if (vendorCode.length() > 0) {
				for (String i : vendorCode.split(",")) {

					vo.setVendorCode(i);
					vendorService.deleteVendor(vo);
				}
			}
		}
	}
	// <!-- 구매업체 관리의 끝 -->

	// 여기서부터 판매업체 관리
	// 판매 업체 관리폼
	@RequestMapping("/manageCustomerForm")
	public String manageCustomerForm(CustomerVO vo) {
		return "items/manageCustomer";
	}

	// 판매 업체 등록
	@RequestMapping("/insertCustomer")
	public String insertCustomer(CustomerVO vo) {
		customerService.insertCustomer(vo);
		return "items/manageCustomer";
	}

	// 판매업체 한건 조회 (onselectedRow)
	@RequestMapping("/getCustomer")
	public CustomerVO getCustomer(CustomerVO vo) {

		return customerService.getCustomer(vo);
	}

	// 판매업체 목록 가져오기
	@RequestMapping("/getCustomerList")
	@ResponseBody
	public List<CustomerVO> getCustomerList(Model model, CustomerVO vo) {
		vo.setFirst(1);
		vo.setLast(30);
		return customerService.getCustomerList(vo);
	}

	// 판매 업체 수정처리
	@RequestMapping("/updateCustomer")
	public String updateCustomer(CustomerVO vo) {
		customerService.updateCustomer(vo);
		return "items/manageCustomer";
	}

	// 판매 업체 여러건 삭제 (거래중단으로 update)
	@RequestMapping("/CustomerEdit")
	@ResponseBody
	public void deleteCustomer(@RequestParam(value = "oper", defaultValue = "", required = false) String oper,
			CustomerVO vo,
			@RequestParam(value = "customerCode", defaultValue = "", required = false) String customerCode) {
		if (oper.equals("del")) {
			customerService.deleteCustomer(vo);
			if (customerCode.length() > 0) {
				for (String i : customerCode.split(",")) {

					vo.setCustomerCode(i);
					customerService.deleteCustomer(vo);
				}
			}
		}
	}
	// <!-- 판매 업체 관리의 끝 -->

	// 여기서부터 주문요청 관리
	// 판매 업체 주문 요청 폼
	@RequestMapping("/getPurchaseRequestForm")
	public String getVendorequest() {
		return "items/getPurchaseRequest";
	}

	// 판매 업체 주문 요청 등록
	@RequestMapping("/insertSales_temp")
	public String insertSales_temp(Sales_tempVO vo, HttpSession session) {
		vo.setCustomerCode(((CustomerVO)session.getAttribute("viewCustomer")).getCustomerCode());
		sales_tempService.insertSales_temp(vo);
		return "items/getPurchaseRequest";
	}

	// 검색 조건. (자동완성 기능 추가예정)
	@RequestMapping("/getItemsList2")
	@ResponseBody
	public List<ItemsVO> getItems(ItemsVO vo) {

		return sales_tempService.getItemsList(vo);
	}

	// 판매 업체 주문 요청 한건 조회 (onselectedRow)
	@RequestMapping("/getSales_temp")
	public Sales_tempVO getSales_temp(Sales_tempVO vo) {

		return sales_tempService.getSales_temp(vo);
	}

	// 판매 업체 주문 요청 목록 가져오기
	@RequestMapping("/getSales_tempList")
	@ResponseBody
	public List<Sales_tempVO> getSales_tempList(Model model, Sales_tempVO vo, HttpSession session) {
		vo.setCustomerCode(((CustomerVO)session.getAttribute("viewCustomer")).getCustomerCode());
		vo.setFirst(1);
		vo.setLast(1000);
		return sales_tempService.getSales_tempList(vo);
	}

	// 판매 업체 주문 요청 수정처리
	@RequestMapping("/updateSales_temp")
	public String updateSales_temp(Sales_tempVO vo) {
		sales_tempService.updateSales_temp(vo);
		return "items/getPurchaseRequest";
	}

	// 판매 업체 여러건 삭제 (거래중단으로 update)
	@RequestMapping("/Sales_tempEdit")
	@ResponseBody
	public void deleteSales_temp(@RequestParam(value = "oper", defaultValue = "", required = false) String oper,
			Sales_tempVO vo,
			@RequestParam(value = "customerCode", defaultValue = "", required = false) String customerCode) {
		if (oper.equals("del")) {
			sales_tempService.deleteSales_temp(vo);
			if (customerCode.length() > 0) {
				for (String i : customerCode.split(",")) {

					vo.setCustomerCode(i);
					sales_tempService.deleteSales_temp(vo);
				}
			}
		}
	}

	// <!-- 주문요청의 끝 -->

	// 기타
	// 사업자등록번호 중복 체크
	@SuppressWarnings("rawtypes")
	@RequestMapping("/checkCustomerCode")
	@ResponseBody
	public Map getCustomerCode(CustomerVO vo) {
		CustomerVO customerCode = customerService.getCustomer(vo);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", customerCode == null ? Boolean.TRUE : Boolean.FALSE);
		return result;
	}

	// 기타2
	// 로그인 기능부분

	// 로그인 폼
	@RequestMapping("login")
	public String login() {
		return "items/login"; // views/items/login.jsp로 이동
	}

	// 로그인 처리
	@RequestMapping("loginCheck")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session, Model model) {
		// Logger logger = LoggerFactory.getLogger(ItemsController.class);

		boolean result = customerService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공

			vo = customerService.getCustomer(vo);
			
			// session에 로그인정보값을 저장한다.
			session.setAttribute("viewCustomer", vo);
			// getPurchaseRequest.jsp로 이동
			if (vo.getCustomerCode().equals("admin12345") && vo.getCustomerPw().equals("12345")) {
				mav.setViewName("stocks/getCharts");
				mav.addObject("msg", "success");
							
			} else {
				mav.setViewName("items/getPurchaseRequest");
				mav.addObject("msg", "success");
			}
					
		} else { // 로그인 실패
			// login.jsp로 이동
			mav.setViewName("items/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}

	// 로그아웃 처리
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		customerService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("items/login");
		mav.addObject("msg", "logout");
		return mav;
	}

}
