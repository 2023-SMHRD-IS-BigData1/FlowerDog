package com.fd.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.BoardDAO;
import com.fd.model.BoardVO;
import com.fd.model.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/BoardupdateService")
public class BoardupdateService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
		BigDecimal board_num = new BigDecimal(request.getParameter("num"));
		
		
		String user_id = loginVO.getUser_id();
		int board_count = 0;
		String board_code ="";
		
		// 공지게시판/자유게시판 구별코드 
		if(loginVO.getUser_id().equals("admin")) {
			board_code = "N";
		}else {
			board_code = "F";	
		}
		
		String path = request.getServletContext().getRealPath("./board_file");
		System.out.println("Board path : "+path);
		
		// 파일 경로에 없을 시 생성
		File dir = new File(path);
		if (!dir.exists()) {
		    dir.mkdirs();
		}

		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// 데이터 가져오기
			System.out.println(multi);

			String board_content = multi.getParameter("board_content");
			String board_tatle = multi.getParameter("board_tatle");
		
			String board_picture = multi.getFilesystemName("board_picture");

			System.out.println( board_tatle + "/" +board_content + "/" +  board_picture);

			BoardVO vo = new BoardVO(board_num, board_content , board_tatle , board_picture);


			int cnt = new BoardDAO().updateBoard(vo);
			
			if (cnt > 0) {
				System.out.println(board_code+"게시물 수정 성공");
				if (board_code.equals("N")){
					response.sendRedirect("notification.jsp?bcode="+board_code);
				}else if (board_code.equals("F")){
					response.sendRedirect("community.jsp?bcode="+board_code);
				}
			} else {
				System.out.println(board_code+"게시물 수정 실패");
				response.sendRedirect("board-fix.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}


