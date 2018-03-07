package com.jhy.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.admin.sql.AdminMapper;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map> select_notice(Map<String, Object> map) {
		AdminMapper adminmapper = sqlSession.getMapper(AdminMapper.class);
		return adminmapper.select_notice(map);
	}

	@Override
	public List<Map> select_noticebyhome() {
		AdminMapper adminmapper = sqlSession.getMapper(AdminMapper.class);
		return adminmapper.select_noticebyhome();
	}

	@Override
	public List<Map> select_noticebyseq(Map<String, Object> map) {
		AdminMapper adminmapper = sqlSession.getMapper(AdminMapper.class);
		return adminmapper.select_noticebyseq(map);
	}
	
	
	
}
