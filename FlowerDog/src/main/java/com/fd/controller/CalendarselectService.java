package com.fd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.CalendarDAO;
import com.fd.model.CalendarVO;
import com.fd.model.MemberVO;
import com.google.gson.Gson;

@WebServlet("/CalendarselectService")
public class CalendarselectService extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ddd");
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String[] calendarDBInfo = request.getParameterValues("calendarDBInfo");

		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
//		세션 ID값
        String user_id = loginVO.getUser_id();
        
        List<CalendarVO> result = new CalendarDAO().selectservice(user_id);
        
		System.out.println(result);
		
        Gson gson = new Gson();
        
        String json = gson.toJson(result);
        
        PrintWriter out = response.getWriter();
        out.print(json);
        
        
        
	}

}
