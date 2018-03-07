package com.jhy.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	public List<Map> select_notice(Map<String, Object> map);

	public List<Map> select_noticebyhome();

	public List<Map> select_noticebyseq(Map<String, Object> map);
	
}
