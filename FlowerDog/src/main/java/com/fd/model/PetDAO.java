package com.fd.model;


import java.util.List;

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
	
	// 사용자 전체 반려동물 정보 호출 
	public List<PetVO> showpet(String user_id){
		SqlSession sqlSession =sqlSessionFactory.openSession(true);
		List<PetVO>pet_list = (List)sqlSession.selectList("com.fd.db.PetMapper.showpet",user_id);
		sqlSession.close();
		return pet_list;
	}
	
	// 사용자 특정 반려동물 정보 수정
	public int petupdate(PetVO petVO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.update("com.fd.db.PetMapper.petupdate", petVO);
		sqlSession.close();
		return cnt;
	}
	
	// 사용자 특정 반려동물 정보 삭제
	public int petdelete(PetVO petVO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.delete("com.fd.db.PetMapper.petdelete", petVO);
		sqlSession.close();
		return cnt;
	}
	


}
