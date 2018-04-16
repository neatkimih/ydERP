package com.yedam.erp.stocks.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.erp.stocks.LookupCodes;

@Repository
public class HomeMybatisDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Map<String, String>> getMostSoldItem() {
		return sqlSession.selectList("stocks.getMostSoldItem");
	}

	public List<Map<String, Object>> getLookups(String LOOKUP) {
		return sqlSession.selectList("stocks.getLookupsData", LOOKUP);
	}

	public List<Map<String, String>> getLookValues() {
		return sqlSession.selectList("stocks.getLookupValues");
	}

	public List<Map<String, String>> selectLookups(String str) {
		return sqlSession.selectList("stocks.selectLookups", str);
	}

	public void updateLookups(LookupCodes vo) {
		sqlSession.update("stocks.updateLookup", vo);
	}
}
