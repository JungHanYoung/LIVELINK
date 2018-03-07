package com.jhy.searchBook.dao;

import java.util.List;
import java.util.Map;

public interface searchBookDao {
		
	public List select(Map map);

	public List detail(int seq);

	public int total_cnt(Map map);

	public void updateHits(int seq);

	public Map revise(List map);

	public List select2(Map map);
	
}
