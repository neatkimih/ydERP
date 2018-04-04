package com.yedam.erp.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.erp.items.ItemsVO;

import com.yedam.erp.common.Paging;
import com.yedam.erp.items.ItemsService;


@Controller
public class ItemsController {

	@Autowired
	ItemsService itemsService;

	// 등록폼
	@RequestMapping("/insertItemsForm")
	public String insertItemsForm() {
		return "items/insertItems";
	}

	// 등록처리
	@RequestMapping("/insertItems")
	public String insertItems(ItemsVO vo) {
		itemsService.insertItems(vo);
		return "redirect:/getItemsList";
	}

	@RequestMapping("/getItemsList")
	public String getItemsList(Model model, ItemsVO vo) {
		model.addAttribute("ItemsList", itemsService.getItemsList(vo));
		return "Items/getItemsList";
	}

	// 상세보기
	@RequestMapping("/getItems")
	public String getItems(Model model, ItemsVO vo) {
		model.addAttribute("Items", itemsService.getItems(vo));
		return "Items/getItems";

	}

	// 수정폼
	@RequestMapping("/updateItemsForm")
	public String updateItemsForm(Model model, ItemsVO vo) {

		model.addAttribute("Items", itemsService.getItems(vo));
		return "Items/updateItems";

	}

	// 수정처리
	@RequestMapping("/updateItems")
	public String updateItems(ItemsVO vo) {
		itemsService.updateItems(vo);
		return "redirect:/getItemsList";

	}

	// 삭제처리
	// 삭제처리
	@RequestMapping("/deleteItems")
	public String deleteItems(ItemsVO vo) {
		itemsService.deleteItems(vo);
		return "redirect:/getItemsList";

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
		return "redirect:getItemsList";
	}


	
	@RequestMapping("/getItemsListGridData")
	@ResponseBody
	public List<ItemsVO> getItemsListGridData(Model model, ItemsVO vo, Paging paging) {
/*		paging.setPageUnit(5);
		paging.setTotalRecord(ItemsService.getCount(vo));
		
		model.addAttribute("ItemsList", ItemsService.getItemsList(vo));
		model.addAttribute("paging", paging);
		return "Items/getItemsList";*/
		vo.setFirst(1);
		vo.setLast(30);
		return itemsService.getItemsList(vo);
	}
	

}
