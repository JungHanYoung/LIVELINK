package com.jhy.searchLib.sql;

import java.util.List;
import java.util.Map;

public interface searchLibMapper {
	public List search(Map map);
	public int count_lib(Map map);
	public int insertFavorit(Map map);
	public List select(Map map);
}