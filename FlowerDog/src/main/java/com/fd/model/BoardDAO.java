package com.fd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fd.db.SqlSessionmanager;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionmanager.getSqlSession();

	// 게시글 작성
	public int writeBoard(BoardVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("com.fd.db.BoardMapper.writeBoard", vo);
		sqlSession.close();
		return cnt;
	}

	// 공지게시판 게시글 조회
	public List<BoardVO> showNotice() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<BoardVO> notice_list = sqlSession.selectList("com.fd.db.BoardMapper.showNotice");
		sqlSession.close();
		return notice_list;
	}

	// 자유게시판 게시글 조회
	public List<BoardVO> showFree() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<BoardVO> free_list = sqlSession.selectList("com.fd.db.BoardMapper.showFree");
		sqlSession.close();
		return free_list;
	}
	 
	// 게시글 상세정보 조회
	public BoardVO detailBoard(int num) {
	      SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      BoardVO board = sqlSession.selectOne("com.fd.db.BoardMapper.detailBoard",num);
		  // 게시글 조회수 업데이트
	      sqlSession.update("com.fd.db.BoardMapper.boardCountup", num); 
		  sqlSession.close();
	      return board;	
	}

	// 게시글 삭제
	public int deleteBoard(BoardVO bvo){
		  SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      int cnt = sqlSession.delete("com.fd.db.BoardMapper.deleteBoard",bvo);
	      sqlSession.close();
		  return cnt;
	}

	// 게시글 수정
	public int updateBoard(BoardVO vo){
		 SqlSession sqlSession = sqlSessionFactory.openSession(true);
		 int cnt = sqlSession.update("com.fd.db.BoardMapper.updateBoard", vo);
		 sqlSession.close();
		 return cnt;
	}
	// 게시글 검색 기능
	public List<BoardVO> getSearch(BoardVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<BoardVO> search_list = new ArrayList<BoardVO>();
		if(vo.getSearch_key().equals("board_tatle")) {
		search_list = sqlSession.selectList("com.fd.db.BoardMapper.getSearchTatle", vo);
		}else if(vo.getSearch_key().equals("board_content")) {
		search_list = sqlSession.selectList("com.fd.db.BoardMapper.getSearchCon", vo);
		}else if(vo.getSearch_key().equals("user_id")) {
		search_list = sqlSession.selectList("com.fd.db.BoardMapper.getSearchUser_id", vo);
		}
		sqlSession.close();
		return search_list;
	}

	
	


}
