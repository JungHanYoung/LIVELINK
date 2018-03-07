package com.jhy.searchBook.sql;

import java.util.List;
import java.util.Map;

public interface searchBookMapper {

	
	public List select(Map map);

	public List detail(int seq);

	public int total_cnt(Map map);

	public Map revise(List map);

	public List select2(Map map);

	public void updateHits(int seq);

}
