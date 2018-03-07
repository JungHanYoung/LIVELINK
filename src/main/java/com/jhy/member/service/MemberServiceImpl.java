
package com.jhy.member.service;




import java.util.List;

import java.util.Map;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Propagation;

import org.springframework.transaction.annotation.Transactional;




import com.jhy.member.dao.MemberDao;




@Service

public class MemberServiceImpl implements MemberService{

   

   @Autowired
   MemberDao memberDao;

   /*@Override
   @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
   public int regist(Map map) {
      return memberDao.regist(map);

   }*/

   @Override
   public List select(Map map) {
      return memberDao.select(map);
   }
   
   @Override
   public List selectMyReview(Map map) {
      return memberDao.selectMyReview(map);
   }
   @Override
   public List myFavorite(Map map) {
      return memberDao.myFavorite(map);
   }
   
   @Override
   public List myLib(Map lib_seq) {
      return memberDao.myLib(lib_seq);
   }

   @Override
   public Integer deleteMyLib(Map map) {
      return memberDao.deleteMyLib(map);
   }
   /*@Override
   public int delete(Map map) {
      return memberDao.delete(map);
   }*/

   @Override
   public int update(Map map) {
      return memberDao.update(map);
   }

   @Override
   public int selectCnt(Map map) {
      return memberDao.selectCnt(map);
   };

   @Override
   public String idCheck(String id) {
      return memberDao.idCheck(id);
   };
   
   @Override
   public int memberRegist(Map map) {
      return memberDao.memberRegist(map);
   }

   @Override
   public Map logincheck(Map map) {
      
      return memberDao.logincheck(map);
   }

   @Override
   public Map select2(Map map) {
      
      return memberDao.select2(map);
   }

   @Override
   public List reservation(Map map) {
      return memberDao.reservation(map);
   }

   @Override
   public int updatepw(Map map) {
      // TODO Auto-generated method stub
      return memberDao.updatepw(map);
   }

   @Override
   public int insertreser(Map map) {
      return memberDao.insertreser(map);
   }

   @Override
   public int deletebook(Map map) {
	
	return memberDao.deletebook(map);
   }

   @Override
   public int total_cnt(Map map) {
	
	return memberDao.total_cnt(map);
}

   @Override
   public List reserselect(Map map) {
	
	return memberDao.reserselect(map);
}




}




