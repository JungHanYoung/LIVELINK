package com.jhy.recommendMonth.dao;

import java.util.List;
import java.util.Map;

public interface RecommendMonthDao {

	public List<Map> select(Map map);
	
	public List<Map> select_pre(Map map);
	
	public int total_cnt();
}
