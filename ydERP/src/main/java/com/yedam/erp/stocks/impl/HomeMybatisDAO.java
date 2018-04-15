package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeMybatisDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Map<String, String>> getMostSoldItem() {
		return sqlSession.selectList("stocks.getMostSoldItem");
	}

	public List<Map<String, Object>> getLookups() {
		return sqlSession.selectList("stocks.getLookups");
	}
}
