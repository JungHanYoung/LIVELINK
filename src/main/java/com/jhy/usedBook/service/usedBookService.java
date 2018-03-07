package com.jhy.usedBook.service;

import java.util.List;
import java.util.Map;

public interface usedBookService {
	public List select(Map map);
	public int total_cnt(Map map);
	public int write(Map map);
	public List search(Map map);
	public List selectSpec(Map map);
	public int update(Map map);
	public int delete(Map map);
	public List<Map> select_pre(Map map);
	
}
