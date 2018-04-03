package com.yedam.erp.items;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("boardService")
public class ItemsServiceImpl implements ItemsService{

	@Autowired
	//BoardDAO dao;
	//BoardSpringJDBC dao;
	ItemsMybatisDAO dao;
	@Override
	public void insertBoard(ItemsVO vo) {
		// TODO Auto-generated method stub
		dao.insertBoard(vo);
	}

	@Override
	public void updateBoard(ItemsVO vo) {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}

	@Override
	public void deleteBoard(ItemsVO vo) {
		// TODO Auto-generated method stub
		dao.deleteBoard(vo);
	}

	@Override
	public ItemsVO getBoard(ItemsVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoard(vo);
	}

	@Override
	public List<ItemsVO> getBoardList(ItemsVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoardList(vo);
	}

	@Override
	public void deleteBoardList(ArrayList<String> seq) {
		// TODO Auto-generated method stub
		dao.deleteBoardList(seq);;
	}

	@Override
	public int getCount(ItemsVO vo) {
		// TODO Auto-generated method stub
		return dao.getCount(vo);
	}

	

	
	
}
