package com.fd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.MemberDAO;
import com.fd.model.MemberVO;

@WebServlet("/UserupdateService")
public class UserupdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession();
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		String user_id = loginVO.getUser_id();
		String user_pw = request.getParameter("user_pw");
		String user_nickname = loginVO.getUser_nickname();
		String main_address = request.getParameter("main_address");
		String sub_address = request.getParameter("sub_address");
		String user_email = request.getParameter("user_email");
		String user_tel = request.getParameter("user_tel");
		String user_gender = request.getParameter("user_gender");
		String user_picture = request.getParameter("user_picture");
		String user_date = "";
		
		System.out.println(user_id+"/"+ user_pw+"/"+ user_nickname+"/"+ main_address+"/"+ sub_address+"/"+user_email+"/"+user_tel+"/"+user_gender+"/"+ user_picture+"/"+user_date);
		
		MemberVO vo = new MemberVO(user_id, user_pw, user_nickname, main_address, sub_address, user_email, user_tel, user_gender, user_picture, user_date);
		
		int cnt = new MemberDAO().updatemember(vo);
		
		if (cnt > 0) {
			System.out.println("수정성공!");
			session.setAttribute("loginVO", vo);
		} else {
			System.out.println("수정실패!");
		}
		response.sendRedirect("my-page-index.jsp");
	}

}
