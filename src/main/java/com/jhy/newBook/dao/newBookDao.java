package com.jhy.newBook.dao;

import java.util.List;
import java.util.Map;

public interface newBookDao {
		
	public List select(Map map);
	public List insert(Map map);
	public List select2(int seq);
	
}
