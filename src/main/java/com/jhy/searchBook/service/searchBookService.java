package com.jhy.searchBook.service;

import java.util.List;
import java.util.Map;

public interface searchBookService {
	
	public List select(Map map);

	public List detail(int seq);

	public int total_cnt(Map map);

	public Map revise(List revise);

	public List select2(Map map);

}
