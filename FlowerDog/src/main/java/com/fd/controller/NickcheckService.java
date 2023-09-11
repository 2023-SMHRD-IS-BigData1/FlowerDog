package com.fd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.MemberDAO;



@WebServlet("/NickcheckService")
public class NickcheckService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_nickname = request.getParameter("user_nickname");
		System.out.println("중복체크할 user_nickname : " + user_nickname);

		boolean check = new MemberDAO().nickcheck(user_nickname);

		PrintWriter out;
		out = response.getWriter();
		out.print(check);

	}
}
