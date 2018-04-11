package com.yedam.erp.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yedam.erp.common.LookupValuesVO;

public class LookupValuesServiceImpl {
	
	@Autowired
	LookupValuesMybatisDAO lookupValuesMybatisDAO;
	
	public List<LookupValuesVO> getLookupValuesList(LookupValuesVO lookupValuesVO) {
		return lookupValuesMybatisDAO.getLookupValueList(lookupValuesVO);
	}
}