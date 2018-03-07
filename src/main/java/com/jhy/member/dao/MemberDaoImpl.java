package com.jhy.member.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.member.sql.MemberMapper;

@Repository
public class MemberDaoImpl implements MemberDao{
   
   @Autowired
   private SqlSession sqlSession;

   /*@Override
   public int regist(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.regist(map);
   }*/

   @Override
   public List select(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.select(map);
   }
   
   @Override
   public List selectMyReview(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.selectMyReview(map);
   }
   
   @Override
   public List myFavorite(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.myFavorite(map);
   }
   
   @Override
   public List myLib(Map lib_seq) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.myLib(lib_seq);
   }
   @Override
   public Integer deleteMyLib(Map map) {
	   MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	   return mapper.deleteMyLib(map);
   }
   
   /*@Override
   public int delete(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.delete(map);
      
   }*/

   @Override
   public int update(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.update(map);
   }



   @Override
   public int selectCnt(Map map) {
      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
      return mapper.selectCnt(map);
   }

   @Override
   public String idCheck(String id) {
	   MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	return mapper.idDobleCheck(id);
}

   @Override
   public int memberRegist(Map map) {
	   MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	   return mapper.memberRegist(map);
	
}

	@Override
	public Map logincheck(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.logincheck(map);
	}

	@Override
	public Map select2(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.select2(map);
	}

	@Override
	public List reservation(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.reservation(map);
	}
	@Override
	public int updatepw(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updatepw(map);
	}
	@Override
	public int insertreser(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insertreser(map);
	}

	@Override
	public int deletebook(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.deletebook(map);
	}

	@Override
	public int total_cnt(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.total_cnt(map);
	}

	@Override
	public List reserselect(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.reserselect(map);
	}

	
}

   

 
   
 
