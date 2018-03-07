package com.jhy.recommendMonth.sql;

import java.util.List;
import java.util.Map;

public interface RecommendMonthMapper {

	public List<Map> select(Map map);
	
	public List<Map> select_pre(Map map);
	
	public int total_cnt();
}
