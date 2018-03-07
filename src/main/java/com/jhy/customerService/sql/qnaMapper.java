package com.jhy.customerService.sql;

import java.util.List;
import java.util.Map;

public interface qnaMapper {
	public List select(Map map);
	
	public List selectSpec(int qnaSeq);
	
	public int write(Map map);


	public int total_cnt(Map map);


	public int replyqna(Map map);

	public List selectBysecret(Map map);

	public int qnaupdate(Map map);

	public int qnadelete(Map map);

	public List checkqnapw(Map map);
}