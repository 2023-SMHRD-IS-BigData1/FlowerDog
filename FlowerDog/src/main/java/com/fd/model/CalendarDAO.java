package com.fd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fd.db.SqlSessionmanager;

public class CalendarDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionmanager.getSqlSession();

//  다이어리 이벤트 생성
	public int insertcalendar(CalendarVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.fd.db.CalendarMapper.insertcalendar", vo);
		sqlSession.close();
		return cnt;
	}
	
//	다이어리 업데이트
	public int updatecalendar(CalendarVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("com.fd.db.CalendarMapper.updatecalendar", vo);
		sqlSession.close();
		return cnt;
	}
	
//	다이어리 호출
	public List<CalendarVO> selectservice(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<CalendarVO> vo = sqlSession.selectList("com.fd.db.CalendarMapper.selectservice", user_id);
		sqlSession.close();
		return vo;
	}
	
	
	
}
