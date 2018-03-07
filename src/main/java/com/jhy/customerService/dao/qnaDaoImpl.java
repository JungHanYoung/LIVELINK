package com.jhy.customerService.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.customerService.sql.qnaMapper;


@Repository
public class qnaDaoImpl implements qnaDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List select(Map map) {
		// TODO Auto-generated method stub
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.select(map);
	}

	@Override
	public List selectSpec(int qnaSeq) {
		// TODO Auto-generated method stub
		
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.selectSpec(qnaSeq);
	}

	@Override
	public int write(Map map) {

		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.write(map);
	}

	@Override
	public int total_cnt(Map map) {
		
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.total_cnt(map);
	}


	@Override
	public int replyqna(Map map) {
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.replyqna(map);
	}

	@Override
	public List selectBysecret(Map map) {
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.selectBysecret(map);
	}

	@Override
	public int qnaupdate(Map map) {
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.qnaupdate(map);
	}

	@Override
	public int qnadelete(Map map) {
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.qnadelete(map);
	}
	@Override
	public List checkqnapw(Map map) {
		qnaMapper mapper = sqlSession.getMapper(qnaMapper.class);
		return mapper.checkqnapw(map);
	}
}
