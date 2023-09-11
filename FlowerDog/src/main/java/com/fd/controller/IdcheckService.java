package com.fd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.model.MemberDAO;

@WebServlet("/IdcheckService")
public class IdcheckService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		System.out.println("중복체크할 user_id : "+ user_id);
		
		boolean check= new MemberDAO().idcheck(user_id);
		
		PrintWriter out;
		out = response.getWriter();
		out.print(check);
	
	}

}
