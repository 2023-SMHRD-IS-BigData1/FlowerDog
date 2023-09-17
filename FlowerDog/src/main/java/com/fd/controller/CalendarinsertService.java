package com.fd.controller;

import java.io.IOException;
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


@WebServlet("/CalendarinsertService")
public class CalendarinsertService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		System.out.println("ddd");
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
		
		String[] calendarEvent = request.getParameterValues("calendarEvent");
		
		    int size = calendarEvent.length;
		    
		    
		    for(int i=0; i<size; i++) {
		        System.out.println("JSP에서 받은 값 : "+calendarEvent[i]);
		    }

        Gson gson = new Gson();
        CalendarVO vo = gson.fromJson(calendarEvent[0], CalendarVO.class);
        String title = vo.getTitle();
        String start = vo.getStart();
        String end = vo.getEnd();
        String user_id = loginVO.getUser_id();
        String backgroundColor = vo.getBackgroundColor();
        String textColor = vo.getTextColor();
 
        System.out.println(user_id);
        System.out.println(title);

        CalendarVO cvo = new CalendarVO(title, start, end, user_id, backgroundColor, textColor); 
        
        int cnt = new CalendarDAO().insertcalendar(cvo);
        

        
	}

}
