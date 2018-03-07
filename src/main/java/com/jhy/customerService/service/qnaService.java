package com.jhy.customerService.service;

import java.util.List;
import java.util.Map;

public interface qnaService {
	public List select(Map map);

	public List selectSpec(int qnaSeq);
	
	public int write(Map map);
	
	public int replyqna(Map map);
	
	public List selectBysecret(Map map);

	public int total_cnt(Map map);

	public int qnaupdate(Map map);

	public int qnadelete(Map map);

	public List checkqnapw(Map map);
}
