package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.gumaesinchungService;
import com.yedam.erp.items.gumaesinchungVO;



@Service("commentsService")
public class gumaesinchungServiceImpl implements gumaesinchungService {

	@Autowired
	gumaesinchungMybatisDAO dao;
	
	public void insertComments(gumaesinchungVO vo) {
		dao.insertComments(vo);
	}
	public void updateComments(gumaesinchungVO vo) {
		dao.updateComments(vo);
	}
	public void deleteComments(gumaesinchungVO vo) {
		dao.deleteComments(vo);
	}	
	public List<gumaesinchungVO> getCommentsList(gumaesinchungVO vo) {
		return dao.getCommentsList(vo);
	}
	public gumaesinchungVO getComments(gumaesinchungVO vo) {
		return dao.getComments(vo);
	}
}
