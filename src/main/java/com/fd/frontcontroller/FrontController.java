package com.fd.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.command.Command;
import com.fd.controller.JoinService;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
				
			// url mapping -> *.do
			// * = 전체
			// .do 확장자가 붙으면 전부 FrontController로 모임
			System.out.println("[FrontController]");

			// 어디서 요청이 들어왔는지 확인
			String uri = request.getRequestURI();
			System.out.println("들어온 요청 : " + uri);

			// 포로젝트 이름 확인
			String project = request.getContextPath();
			System.out.println("포르젝트 이름 : " + project);

			uri = uri.substring(project.length() + 1);
			System.out.println("요청 서블릿: " + uri);
			
			Command service = null;
			
			request.setCharacterEncoding("UTF-8");
			String moveURL = null;
			
			if (uri.equals("JoinService.do")) {
				service = new JoinService();
			}else {
				System.out.println("아아아 안돼");
			}
			
			moveURL = service.execute(request, response);
			
			if(moveURL != null) {
			response.sendRedirect(moveURL);
			}
		}
	}

