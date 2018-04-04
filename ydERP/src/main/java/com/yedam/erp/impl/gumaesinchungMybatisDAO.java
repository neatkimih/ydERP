package com.yedam.erp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.gumaesinchungVO;



@Repository
public class gumaesinchungMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	 public void insertComments(gumaesinchungVO vo){
		 sqlSession.insert("comments.insertComments", vo);
	 }
	 
	 public void updateComments(gumaesinchungVO vo){
		 sqlSession.update("comments.updateComments", vo);
	 }
	 
	 public void deleteComments(gumaesinchungVO vo){
		 sqlSession.delete("comments.deleteComments", vo);
	 }	 	 
	 public List<gumaesinchungVO> getCommentsList(gumaesinchungVO vo){
		 return sqlSession.selectList("comments.getCommentsList", vo);
	 }
	 public gumaesinchungVO getComments(gumaesinchungVO vo){
		 return sqlSession.selectOne("comments.getComments", vo);
	 }
}
