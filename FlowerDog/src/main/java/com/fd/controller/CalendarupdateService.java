package com.fd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.CalendarVO;
import com.fd.model.MemberVO;

@WebServlet("/CalendarupdateService")
public class CalendarupdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		String user_id = loginVO.getUser_id();
		
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("calendar-board__head");
		String start =  request.getParameter("calendar-board__sday");
		String end =  request.getParameter("calendar-board__eday");
		String description =  request.getParameter("calendar-board__content");
		String backgroundColor =  request.getParameter("calendar-board__back");
		String textColor =  request.getParameter("calendar-board__font");
		
		CalendarVO cvo = new CalendarVO(title, start, end, description, backgroundColor, textColor, user_id); 
		
	}

}
