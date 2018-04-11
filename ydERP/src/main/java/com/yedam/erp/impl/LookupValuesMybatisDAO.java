package com.yedam.erp.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.erp.common.LookupValuesVO;

public class LookupValuesMybatisDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<LookupValuesVO> getLookupValueList(LookupValuesVO lookupValuesVO) {
		return sqlSession.selectList("lookupvalues.getLookupValueList", lookupValuesVO);
	}
}
