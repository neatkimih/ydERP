package com.yedam.erp.view;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.items.ItemsVO;
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
	
	
	// 여기서부터 판매업체 관리 
	
	// 판매 업체 관리폼
	@RequestMapping("/getRegisterForm")
	public String getRegisterForm(CustomerVO vo) {
		return "items/getRegister";
	}
	
	// 판매 업체 등록
	@RequestMapping("/getRegister")
	public String getRegister(CustomerVO vo) {
		customerService.insertCustomer(vo);
		return "items/getRegister";
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
			return "items/getRegister";
	}
	
	//판매 업체 여러건 삭제 (거래중단으로 update)
	@RequestMapping("/CustomerEdit")
	@ResponseBody
	public void deleteCustomer(@RequestParam(value = "oper", defaultValue = "", required = false) String oper, CustomerVO vo,
								@RequestParam(value = "customerCode", defaultValue = "", required = false) String customerCode) {
		System.out.println("=========================88888====" + vo);
		if (oper.equals("del")) {
			System.out.println("=========================77777====" + vo);
			customerService.deleteCustomer(vo);
			System.out.println("=========================66666====" + vo);
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
}
