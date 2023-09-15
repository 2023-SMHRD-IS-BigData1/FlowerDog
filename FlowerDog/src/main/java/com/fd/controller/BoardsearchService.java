package com.fd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.BoardDAO;
import com.fd.model.BoardVO;

@WebServlet("/BoardsearchService")
public class BoardsearchService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("[BoardsearchService]");
		
		String search = request.getParameter("search");
		
		
		String search_key = request.getParameter("search_key");
		if (search_key.equals("Title")) {
			search_key = "board_tatle";
			search = "%"+search+"%";
		} else if (search_key.equals("Content")) {
			search_key = "board_content";
			search = "%"+search+"%";
		} else if (search_key.equals("Name")) {
			search_key = "user_id";
		}
		System.out.println("search_key : "+search_key);
		
		
		if(search==null) {
			System.out.println("search 값 없어서 전체게시판 조회 페이지 이동");
			response.sendRedirect(search);
		}
		
		
		
		
		
		System.out.println("search : "+search);
		
		String board_code = request.getParameter("bcode") ;
		System.out.println(board_code);
		
		
		BoardVO vo = new BoardVO(search_key,search , board_code);
		List<BoardVO> search_list= (List<BoardVO>) new BoardDAO().getSearch(vo);
		
		if(search_list != null) {
			System.out.println("검색 성공");
			if(board_code.equals("F")) {
				RequestDispatcher rd = request.getRequestDispatcher("community.jsp");
				request.setAttribute("search_list", search_list);
				rd.forward(request, response);
			}else if (board_code.equals("N")){
				RequestDispatcher rd = request.getRequestDispatcher("notification.jsp");
				request.setAttribute("search_list", search_list);
				rd.forward(request, response);
			}
			
		}else {
			System.out.println("검색 실패 or 검색 결과 없음");
			response.sendRedirect("index-login.jsp");
		}
		
	}

}
