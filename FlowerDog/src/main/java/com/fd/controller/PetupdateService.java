package com.fd.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fd.model.MemberVO;
import com.fd.model.PetDAO;
import com.fd.model.PetVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PetupdateService")
public class PetupdateService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[PetupdateService]");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		String user_id = loginVO.getUser_id();
		
		String path = request.getServletContext().getRealPath("./pet_file");


		System.out.println("path : " + path);
		
		// 파일 경로에 없을 시 생성
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi;

		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);

			String pet_id = multi.getParameter("pet_id");
			String pet_type = multi.getParameter("pet_type");
			String pet_picture = multi.getFilesystemName("pet_picture");
			int pet_age = Integer.parseInt(multi.getParameter("pet_age"));
			String pet_gender = multi.getParameter("pet_gender");
			String pet_date = multi.getParameter("pet_date");

			System.out.println(pet_id + "/" + pet_type + "/" + pet_picture + "/" + pet_age + "/" + user_id + "/"
					+ pet_gender + "/" + pet_date);

			PetVO petVO = new PetVO(pet_id, pet_type, pet_picture, pet_age, user_id, pet_gender, pet_date);

			int cnt = new PetDAO().petupdate(petVO);

			if (cnt > 0) {
				System.out.println("반려동물 수정 성공");
				response.sendRedirect("pet-page-index.jsp");
			} else {
				System.out.println("반려동물 수정 실패");
				response.sendRedirect("pet-page-fix.jsp");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}