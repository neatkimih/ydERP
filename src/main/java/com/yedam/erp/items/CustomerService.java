package com.yedam.erp.items;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface CustomerService {

	public void insertCustomer(CustomerVO vo);
	public void updateCustomer(CustomerVO vo);
	public CustomerVO getCustomer(CustomerVO vo);
	public List<CustomerVO> getCustomerList(CustomerVO vo);
	public void deleteCustomer(CustomerVO vo);
    //로그인 체크
    public boolean loginCheck(CustomerVO vo, HttpSession session);
    //회원 로그인 정보
    public CustomerVO viewCustomer(CustomerVO vo);
    //로그아웃
    public void logout(HttpSession session);
	
    
    
}
