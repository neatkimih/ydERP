package com.yedam.erp.items;

import java.util.List;

public interface gumaesinchungService {
	public void insertComments(gumaesinchungVO vo);
	public void updateComments(gumaesinchungVO vo);
	public void deleteComments(gumaesinchungVO vo);
	public List<gumaesinchungVO> getCommentsList(gumaesinchungVO vo);
	public gumaesinchungVO getComments(gumaesinchungVO vo);
}
