package com.jhy.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.newBook.sql.newBookMapper;
import com.jhy.review.sql.reviewMapper;

@Repository
public class reviewDaoImpl implements reviewDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List select(Map map) {
		reviewMapper mapper = sqlSession.getMapper(reviewMapper.class);
		return mapper.select(map);
	}
	
	@Override
	public List select2(Map map) {
		reviewMapper mapper = sqlSession.getMapper(reviewMapper.class);
		return mapper.select2(map);
	}
	@Override
	public List select3(Map map) {
		reviewMapper mapper = sqlSession.getMapper(reviewMapper.class);
		return mapper.select3(map);
	}
	
	@Override
	public List insert(Map map) {
		newBookMapper mapper = sqlSession.getMapper(newBookMapper.class);
		return mapper.insert(map);
	}
	
	@Override
	public Integer regist(Map map) {
		reviewMapper mapper = sqlSession.getMapper(reviewMapper.class);
		return mapper.regist(map);
	}
	
	@Override
	public int selectCnt(Map map) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.selectCnt(map);
	}
	
	public int update(Map map) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.update(map);
	}

	public List selectMyReview(Map map) {
		reviewMapper mapper = sqlSession.getMapper(reviewMapper.class);
		return mapper.selectMyReview(map);
	}


	@Override
	public int reviewupdate(Map map) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.reviewupdate(map);
	}

	@Override
	public int reviewdelete(Map map) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.reviewdelete(map);
	}

	@Override
	public List<Map<String, Object>> selectbys_seq(int s_seq) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.selectbys_seq(s_seq);
	}

	@Override
	public List<Map<String, Object>> stars_by_book(int s_seq) {
		reviewMapper mapper=sqlSession.getMapper(reviewMapper.class);
		return mapper.stars_by_book(s_seq);
	}

}
