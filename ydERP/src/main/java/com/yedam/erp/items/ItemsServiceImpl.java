package com.yedam.erp.items;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("itemsService")
public class ItemsServiceImpl implements ItemsService {

	@Autowired

	ItemsMybatisDAO dao;

	@Override
	public void insertItems(ItemsVO vo) {
		dao.insertItems(vo);
	}

	@Override
	public void updateItems(ItemsVO vo) {
		dao.updateItems(vo);
	}

	@Override
	public void deleteItems(ItemsVO vo) {
		dao.deleteItems(vo);
	}

	@Override
	public ItemsVO getItems(ItemsVO vo) {
		return dao.getItems(vo);
	}

	@Override
	public List<ItemsVO> getItemsList(ItemsVO vo) {
		return dao.getItemsList(vo);
	}

	@Override
	public void deleteItemsList(ArrayList<String> seq) {
		dao.deleteItemsList(seq);
		;
	}

	@Override
	public int getCount(ItemsVO vo) {
		return dao.getCount(vo);
	}

}
