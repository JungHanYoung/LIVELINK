package com.jhy.admin.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	public List<Map> select_notice(Map<String, Object> map);

	public List<Map> select_noticebyhome();

	public List<Map> select_noticebyseq(Map<String, Object> map);
	
}
