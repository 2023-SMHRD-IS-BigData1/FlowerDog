package com.fd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.MemberDAO;
import com.fd.model.MemberVO;


@WebServlet("/SignupService")
public class SignupService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nickname = request.getParameter("user_nickname");
		String main_address = request.getParameter("main_address");
		String sub_address = request.getParameter("sub_address");
		String user_email = request.getParameter("user_email");
		String user_tel = request.getParameter("user_tel");
		String user_gender = request.getParameter("user_gender");
		String user_picture = "";
		String user_date = "";
		
		System.out.println(user_id+"/"+ user_pw+"/"+ user_nickname+"/"+ main_address+"/"+ sub_address+"/"+user_email+"/"+user_tel+"/"+user_gender+"/"+ user_picture+"/"+user_date);
		
		MemberVO vo = new MemberVO(user_id, user_pw, user_nickname, main_address, sub_address, user_email, user_tel, user_gender, user_picture, user_date);
		
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.signup(vo);
		
		if(cnt > 0) {
			// 회원가입 성공
			System.out.println("회원가입 성공~!");
			// 포워딩 방식 JoinSuccess.jsp로 이동, request영역에 email 저장
//			RequestDispatcher rd = request.getRequestDispatcher("JoinSuccess.jsp");
//			request.setAttribute("joinEmail", email);
//			request.setAttribute("joinVO", vo);
//			rd.forward(request, response);
			
			response.sendRedirect("index-login.jsp?user_nickname="+user_nickname);
		}else {
			// 회원가입 실패
			System.out.println("회원가입 실패...");
			response.sendRedirect("sign-up.jsp");
			
		}
	}

}
