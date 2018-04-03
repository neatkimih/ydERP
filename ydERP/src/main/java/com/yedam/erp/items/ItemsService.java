package com.yedam.erp.items;

import java.util.ArrayList;
import java.util.List;

public interface ItemsService {

	
	
	public void insertBoard(ItemsVO vo);
	public void updateBoard(ItemsVO vo);
	public void deleteBoard(ItemsVO vo);
	public ItemsVO getBoard(ItemsVO vo);
	public List<ItemsVO> getBoardList(ItemsVO vo);
	public void deleteBoardList(ArrayList<String> seq);
	public int getCount(ItemsVO vo);
}
