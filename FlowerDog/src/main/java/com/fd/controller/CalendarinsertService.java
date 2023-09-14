package com.fd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.CalendarVO;
import com.fd.model.MemberVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/CalendarinsertService")
public class CalendarinsertService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("ddd");
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
		
		
		String user_id = loginVO.getUser_id();
		System.out.println(user_id);
		
		String[] calendarEvent = request.getParameterValues("calendarEvent");
		
		    int size = calendarEvent.length;
		    
		    
		    for(int i=0; i<size; i++) {
		        System.out.println("JSP에서 받은 값 : "+calendarEvent[i]);
		    }
		
		 // 요청 본문에서 JSON 데이터 읽기
//        StringBuilder sb = new StringBuilder();
//        String line;
//        try (BufferedReader reader = request.getReader()) {
//            while ((line = reader.readLine()) != null) {
//                sb.append(line);
//            }
//        }
//
//        // Gson을 사용하여 JSON 데이터를 DataDTO 객체로 변환
//        Gson gson = new Gson();
//        JsonObject jsonObject = new JsonObject();
//        jsonObject.addProperty("cntlrId", "3001");
//        jsonObject.addProperty("pnlTp", "20.99552");
//        jsonObject.addProperty("pnlHd", "52.51834");
//        jsonObject.addProperty("colctdate", "2020-06-30 00:00:00");
//        jsonObject.addProperty("cntlrMode", "Manual");
//        CalendarVO vo = gson.fromJson(sb.toString(), CalendarVO.class);
//        System.out.println(vo);
        
	}

}
