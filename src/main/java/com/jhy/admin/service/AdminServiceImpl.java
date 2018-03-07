package com.jhy.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.admin.dao.AdminDao;
import com.jhy.member.dao.MemberDao;

@Service
@Transactional(readOnly = true)
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	

	@Override
	public List<Map> select_notice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDao.select_notice(map);
	}


	@Override
	public List<Map> select_noticebyhome() {
		return adminDao.select_noticebyhome();
	}


	@Override
	public List<Map> select_noticebyseq(Map<String, Object> map) {
		return adminDao.select_noticebyseq(map);
	}
	
}
