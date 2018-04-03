package com.yedam.erp.items;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class ItemsMybatisDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertBoard(ItemsVO vo) {
		sqlSession.insert("board.insertBoard",vo);
	}
	
	public void updateBoard(ItemsVO vo) {
		sqlSession.update("board.updateBoard",vo);
	}
	
	public void deleteBoard(ItemsVO vo) {
		sqlSession.delete("board.deleteBoard",vo);
	}
	
	public ItemsVO getBoard(ItemsVO vo) {
		System.out.println("mybatis");
		return sqlSession.selectOne("board.getBoard",vo);
	}
	
	public List<ItemsVO> getBoardList(ItemsVO vo) {
		System.out.println("mybatis list");
		return sqlSession.selectList("board.getBoardList",vo);
	}
	
	public void deleteBoardList(ArrayList<String> seq) {
		sqlSession.delete("board.deleteBoardList",seq);
	}
	
	public int getCount(ItemsVO vo) {
		return sqlSession.selectOne("board.getCount",vo);
	}
}
