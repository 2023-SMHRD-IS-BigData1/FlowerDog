package com.fd.model;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fd.db.SqlSessionmanager;

public class PetDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionmanager.getSqlSession();
	
	// 반려동물 등록
	public int petinsert(PetVO petVO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.fd.db.PetMapper.petinsert", petVO);
		sqlSession.close();
		return cnt;
	}

}
