package com.fd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fd.db.SqlSessionmanager;

public class FacilityDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionmanager.getSqlSession();
	
	public List<FacilityVO> park_north(){ // 북구 공원 정보 가져오기
		
		 SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		 List<FacilityVO> north_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.park_north");
		
		 sqlsession.close();
		 
		return north_list;
	}
	
	public List<FacilityVO> park_east(){ // 동구 공원 정보 가져오기
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		List<FacilityVO> east_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.park_east");
		
		sqlsession.close();
		
		return east_list;
	}
	
	public List<FacilityVO> park_west(){ // 서구 공원 정보 가져오기
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		List<FacilityVO> west_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.park_west");
		
		sqlsession.close();
		
		return west_list;
	}
	
	public List<FacilityVO> park_south(){ // 북구 공원 정보 가져오기
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		List<FacilityVO> south_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.park_south");
		
		sqlsession.close();
		
		return south_list;
	}
	
	public List<FacilityVO> park_kwang(){ // 북구 공원 정보 가져오기
		
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		List<FacilityVO> kwang_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.park_kwang");
		
		sqlsession.close();
		
		return kwang_list;
	}
	
	
	
	
	
	
	
	
	public List<FacilityVO> hospi_Facility(){
		
		 SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		 List<FacilityVO> Hospi_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.hospi_Facility");
		
		 sqlsession.close();
		 
		return Hospi_list;
	}
	
	public List<FacilityVO> shop_Facility(){
		
		 SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		 List<FacilityVO> Shop_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.shop_Facility");
		
		 sqlsession.close();
		 
		return Shop_list;
	}
	
	public List<FacilityVO> buti_Facility(){
		
		 SqlSession sqlsession = sqlSessionFactory.openSession(true);
		
		 List<FacilityVO> buti_list = (List)sqlsession.selectList("com.fd.db.FacilityMapper.buti_Facility");
		
		 sqlsession.close();
		 
		return buti_list;
	}
	

}
