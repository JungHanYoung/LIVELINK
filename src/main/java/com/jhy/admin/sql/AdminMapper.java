package com.jhy.admin.sql;

import java.util.List;
import java.util.Map;

public interface AdminMapper {
	
	public List<Map> select_notice(Map<String, Object> map);

	public List<Map> select_noticebyhome();

	public List<Map> select_noticebyseq(Map<String, Object> map);
	
}
