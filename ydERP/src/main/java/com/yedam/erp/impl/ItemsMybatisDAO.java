package com.yedam.erp.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.ItemsVO;



@Repository
public class ItemsMybatisDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertItems(ItemsVO vo) {
		sqlSession.insert("Items.insertItems",vo);
	}
	
	public void updateItems(ItemsVO vo) {
		sqlSession.update("Items.updateItems",vo);
	}
	
	public void deleteItems(ItemsVO vo) {
		sqlSession.delete("Items.deleteItems",vo);
	}
	
	public ItemsVO getItems(ItemsVO vo) {
		System.out.println("mybatis");
		return sqlSession.selectOne("Items.getItems",vo);
	}
	
	public List<ItemsVO> getItemsList(ItemsVO vo) {
		System.out.println("mybatis list");
		return sqlSession.selectList("Items.getItemsList",vo);
	}
	
	public void deleteItemsList(ArrayList<String> seq) {
		sqlSession.delete("Items.deleteItemsList",seq);
	}
	
	public int getCount(ItemsVO vo) {
		return sqlSession.selectOne("Items.getCount",vo);
	}
}
