package com.fd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.BoardDAO;
import com.fd.model.BoardVO;


@WebServlet("/BoarddeleteService")
public class BoarddeleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

        int board_num =  Integer.parseInt(request.getParameter("num"));
        System.out.println("[BoarddeleteService] : "+board_num);
        BoardVO bvo = new BoardDAO().detailBoard(board_num);
        int cnt = new BoardDAO().deleteBoard(bvo);
        
        if (cnt > 0){
        	
            System.out.println("게시글 삭제 완료");
            
            if (bvo.getBoard_code().equals("F")) {
            	response.sendRedirect("community.jsp");
            } else if (bvo.getBoard_code().equals("N")) {
            	response.sendRedirect("notification.jsp?");
            }
        } else {
            System.out.println("게시글 삭제 실패 ");
        }

	}

}
