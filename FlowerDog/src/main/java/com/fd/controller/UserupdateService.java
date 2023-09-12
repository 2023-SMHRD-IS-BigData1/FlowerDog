package com.fd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fd.model.MemberDAO;
import com.fd.model.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UserupdateService")
public class UserupdateService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[UpdateService]");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");

		String user_id = loginVO.getUser_id();
		String user_nickname = loginVO.getUser_nickname();
		String user_date = "";

		String path = request.getServletContext().getRealPath("./user_file");

		System.out.println("path : " + path);

		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);

			String user_pw = multi.getParameter("user_pw");
			String main_address = multi.getParameter("main_address");
			String sub_address = multi.getParameter("sub_address");
			String user_email = multi.getParameter("user_email");
			String user_tel = multi.getParameter("user_tel");
			String user_gender = multi.getParameter("user_gender");
			String user_picture = multi.getFilesystemName("user_picture");

			System.out.println(user_id + "/" + user_pw + "/" + user_nickname + "/" + main_address + "/" + sub_address
					+ "/" + user_email + "/" + user_tel + "/" + user_gender + "/" + user_picture + "/" + user_date);

			MemberVO vo = new MemberVO(user_id, user_pw, user_nickname, main_address, sub_address, user_email, user_tel,
					user_gender, user_picture, user_date);

			int cnt = new MemberDAO().updatemember(vo);

			if (cnt > 0) {
				System.out.println("수정성공!");
				session.setAttribute("loginVO", vo);
			} else {
				System.out.println("수정실패!");
			}
			response.sendRedirect("my-page-index.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}