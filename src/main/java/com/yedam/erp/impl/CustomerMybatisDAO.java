package com.yedam.erp.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.items.CustomerVO;

@Repository
public class CustomerMybatisDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CustomerVO> getCustomerList(CustomerVO vo) {
		
		return sqlSession.selectList("items.getCustomerList",vo);
	}

	public void deleteCustomer(CustomerVO vo) {
		sqlSession.delete("items.deleteCustomer",vo);
	}

	public void insertCustomer(CustomerVO vo) {
		sqlSession.insert("items.insertCustomer",vo);
	}
	
	public void updateCustomer(CustomerVO vo) {
		sqlSession.update("items.updateCustomer",vo);
	}
	
	public CustomerVO getCustomer(CustomerVO vo) {
		return sqlSession.selectOne("items.getCustomer",vo);
	}
    // 회원 로그인체크
    
    public boolean loginCheck(CustomerVO vo) {
        String name = sqlSession.selectOne("items.loginCheck", vo);
        return name != null;
    }
    // 회원 로그인 정보
   
    public CustomerVO viewCustomer(CustomerVO vo) {
        return sqlSession.selectOne("items.viewCustomer", vo);
    }
    //회원 로그아웃
    
    public void logout(HttpSession sessin) {
    }
	
}
