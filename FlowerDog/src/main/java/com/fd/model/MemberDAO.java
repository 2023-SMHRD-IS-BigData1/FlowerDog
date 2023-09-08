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
	
	// 아이디 중복체크
	public boolean idcheck(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberVO vo = sqlSession.selectOne("com.fd.db.MemberMapper.idcheck", user_id);
		sqlSession.close();
		if(vo!= null) {
			// 중복 O
			 return false; 
		}else {
			// 중복 X
			return true;
		}
	}
	// 닉네임 중복체크
	public boolean nickcheck(String user_nickname) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberVO vo = sqlSession.selectOne("com.fd.db.MemberMapper.nickcheck", user_nickname);
		sqlSession.close();
		if(vo!= null) {
			// 중복 O
			 return false; 
		}else {
			// 중복 X
			return true;
		}
	}
}
