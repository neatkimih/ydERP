package com.yedam.erp.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.erp.items.ItemsVO;
import com.yedam.erp.sales.CustomersVO;
import com.yedam.erp.items.CustomerService;
import com.yedam.erp.items.CustomerVO;
import com.yedam.erp.items.ItemsService;
 


@Controller
public class ItemsController {

	@Autowired
	ItemsService itemsService;

	@Autowired
	CustomerService customerService;
	
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

	//품목 전체 조회 폼
	@RequestMapping("/getItemsList")
	public String getItems() {
		return "items/getitemsList";
	}
	
	//품목 전체 조회 처리
	@RequestMapping("/getItemsList.do")
	@ResponseBody
	public List<ItemsVO> getItemsListGridData(Model model, ItemsVO vo) {
		vo.setFirst(1);
		vo.setLast(30);
		return itemsService.getItemsList(vo);
	}
	
	//품목 추가, 수정, 삭제 기능
	@RequestMapping("/getItemsDataEdit")
	@ResponseBody
	public void getItemsDataEdit(@RequestParam(value = "oper", defaultValue = "", required = false) String oper, ItemsVO vo,
								@RequestParam(value = "itemCode", defaultValue = "", required = false) String itemCode) {
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
	
	// 여기서부터 구매업체 관리
	
	// 판매 업체 관리폼
		@RequestMapping("/getPurchase2")
		public String getPurchase2(CustomerVO vo) {
			return "items/getPurchase2";
		}
	
	
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
	
	//판매업체 한건 조회 (onselectedRow)
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
	
	//판매 업체 여러건 삭제 (거래중단으로 update)
	@RequestMapping("/CustomerEdit")
	@ResponseBody
	public void deleteCustomer(@RequestParam(value = "oper", defaultValue = "", required = false) String oper, CustomerVO vo,
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
	//<!-- 판매 업체 관리의 끝 -->

	// 여기서부터 주문요청 관리
	// 주문요청
	@RequestMapping("/getPurchaseRequest")
	public String getPurchaseRequest() {
		return "items/getPurchaseRequest";
	}
	
	//<!-- 주문요청의 끝 -->
	
	
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
	// 해결 과제
    // 로그인 기능부분
	
    // 로그인 폼
    @RequestMapping("login")
    public String login(){
    return "items/login";    // views/items/login.jsp로 이동
    }
    
    // 로그인 처리

	@RequestMapping("loginCheck")
    public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session, Model model){
    	Logger logger = LoggerFactory.getLogger(ItemsController.class);
    	
    	boolean result = customerService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // getPurchaseRequest.jsp로 이동
        	
        	session.setAttribute("viewCustomer",vo);
            
        	mav.setViewName("items/getPurchaseRequest");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("items/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    } 
    
    // 로그아웃 처리
    @RequestMapping("logout")
    public ModelAndView logout(HttpSession session){
        customerService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("items/login");
        mav.addObject("msg", "logout");
	        return mav;
	    }

}
	
	
	
	
	

