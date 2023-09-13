package com.fd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.MemberVO;
import com.fd.model.PetDAO;
import com.fd.model.PetVO;

@WebServlet("/PetdeleteService")
public class PetdeleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		String user_id = loginVO.getUser_id();
		String pet_id = request.getParameter("petId");
		System.out.println(user_id + "/" + pet_id);

		PetVO petVO = new PetVO(pet_id,user_id);
		int cnt = new PetDAO().petdelete(petVO);

		if (cnt > 0) {
			System.out.println(pet_id + "반려동물 삭제 성공");
		} else {
			System.out.println(pet_id + "반려동물 삭제 실패");
		}

		response.sendRedirect("pet-page-index.jsp");
	}
}
