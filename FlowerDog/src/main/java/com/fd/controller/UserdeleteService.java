package com.fd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.MemberDAO;

@WebServlet("/UserdeleteService")
public class UserdeleteService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		
		int cnt = new MemberDAO().deletemember(user_id);
		
		if (cnt > 0) {
			System.out.println(user_id + "삭제 성공");
		} else {
			System.out.println(user_id + "삭제 실패");
		}
		response.sendRedirect("index.jsp");
		
	}

}
