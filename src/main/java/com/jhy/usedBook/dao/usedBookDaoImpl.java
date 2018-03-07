package com.jhy.usedBook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.usedBook.sql.usedBookMapper;


@Repository
public class usedBookDaoImpl implements usedBookDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List select(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.select(map);
	}

	@Override
	public int total_cnt(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.total_cnt(map);
	}
	
	@Override
	public int write(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.write(map);

	
	}
	@Override
	public int delete(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.delete(map);

	
	}
	
	
	@Override
	public int update(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.update(map);
	}
	
	@Override
	public List search(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.search(map);
	}

	@Override
	public List selectSpec(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.selectSpec(map);
	}

	@Override
	public List<Map> select_pre(Map map) {
		usedBookMapper mapper = sqlSession.getMapper(usedBookMapper.class);
		return mapper.select_pre(map);
	}


}
