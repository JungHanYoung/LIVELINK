package com.jhy.review.service;

import java.util.List;
import java.util.Map;

public interface reviewService {
	
	public List select(Map map);
	public List insert(Map map);
	public Integer regist(Map map);
	public int selectCnt(Map map);
	public List select2(Map map);

	public List select3(Map map);

	public int update(Map map);

	public List selectMyReview(Map map); 

	public int reviewupdate(Map map);
	public int reviewdelete(Map map);
	public List<Map<String, Object>> selectbys_seq(int seq);
	public List<Map<String, Object>> stars_by_book(int seq);



}
