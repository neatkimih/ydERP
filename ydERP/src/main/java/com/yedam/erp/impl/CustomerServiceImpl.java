package com.yedam.erp.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.erp.items.CustomerService;
import com.yedam.erp.items.CustomerVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerMybatisDAO dao;

	@Override
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		return dao.getCustomerList(vo);

	}

	@Override
	public void deleteCustomer(CustomerVO vo) {
		dao.deleteCustomer(vo);

	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		dao.insertCustomer(vo);
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		dao.updateCustomer(vo);
	}

	@Override
	public CustomerVO getCustomer(CustomerVO vo) {
		return dao.getCustomer(vo);
	}

	
	// 로그인 정보
	@Override
	public CustomerVO viewCustomer(CustomerVO vo) {
		return dao.viewCustomer(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {

		session.invalidate();
	}

	// 회원 로그인체크
	@Override
	public boolean loginCheck(CustomerVO vo, HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if (result) { // true일 경우 세션에 등록
			CustomerVO vo2 = viewCustomer(vo);
			// 세션 변수 등록
			session.setAttribute("getCustomerCode", vo2.getCustomerCode());
			session.setAttribute("getCustomerName", vo2.getCustomerName());
		}
		return result;
		
	}
}
