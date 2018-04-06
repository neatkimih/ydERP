package com.yedam.erp.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.items.ItemsVO;
import com.yedam.erp.items.ItemsService;


@Controller
public class ItemsController {

	@Autowired
	ItemsService itemsService;

	// 등록폼
	@RequestMapping("/insertItemsForm")
	public String insertItemsForm() {
		return "items/getitemsList";
	}

	// 등록처리
	@RequestMapping("/insertItems")
	public String insertItems(ItemsVO vo) {
		itemsService.insertItems(vo);
		return "items/getitemsList";
	}

	// 수정폼
	@RequestMapping("/updateItemsForm")
	public String updateItemsForm(Model model, ItemsVO vo) {

		model.addAttribute("Items", itemsService.getItems(vo));
		return "items/getitemsList";
	}

	// 수정처리
	@RequestMapping("/updateItems")
	public String updateItems(ItemsVO vo) {
		itemsService.updateItems(vo);
		return "items/getitemsList";

	}

	// 삭제처리
	@RequestMapping("/deleteItems")
	public String deleteItems(ItemsVO vo) {
		itemsService.deleteItems(vo);
		return "items/getitemsList";
	}
	
	// 중복체크
	@RequestMapping("/dupCheck")
	@ResponseBody
	public Map<String, Boolean> dupCheck(ItemsVO vo) {
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		if (itemsService.getItems(vo) == null) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}

		return map;
	}

	// 로그 아웃

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "views/home";
	}

	@RequestMapping("/getItemsList")
	public String getItems() {
		return "items/getitemsList";
	}
	
	@RequestMapping("/getItemsList.do")
	@ResponseBody
	public List<ItemsVO> getItemsListGridData(Model model, ItemsVO vo) {
		vo.setFirst(1);
		vo.setLast(30);
		return itemsService.getItemsList(vo);
	}
	
	@RequestMapping("/getItemsDataEdit")
	@ResponseBody
	public void getItemsDataEdit(@RequestParam(value = "oper", defaultValue = "", required = false) String oper, ItemsVO vo,
			@RequestParam(value = "itemCode", defaultValue = "", required = false) String itemCode) {
		System.out.println("[editController][edit]");
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
	

}
