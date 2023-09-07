package com.fd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fd.db.SqlSessionmanager;



public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionmanager.getSqlSession();
	
	// 회원가입
	public int signup(MemberVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.fd.db.MemberMapper.signup", vo);
		sqlSession.close();
		return cnt;
	}
	
}
