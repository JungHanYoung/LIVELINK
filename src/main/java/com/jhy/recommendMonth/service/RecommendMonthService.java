package com.jhy.recommendMonth.service;

import java.util.List;
import java.util.Map;

public interface RecommendMonthService {
	
	public List<Map> select(Map map);

	public List<Map> select_pre(Map map);
	
	public int total_cnt();
}
