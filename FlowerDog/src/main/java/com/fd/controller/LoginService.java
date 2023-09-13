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

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		System.out.println(user_id + "/" + user_pw);
		
		MemberVO vo = new MemberVO(user_id, user_pw);
		
		MemberVO loginVO = new MemberDAO().login(vo);
		
		if (loginVO != null) {
			// 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("loginVO", loginVO);
			session.setMaxInactiveInterval(0);
			response.sendRedirect("index-login.jsp");
		} else {
			// 로그인 실패
			response.sendRedirect("login.jsp");
		}
	}

}