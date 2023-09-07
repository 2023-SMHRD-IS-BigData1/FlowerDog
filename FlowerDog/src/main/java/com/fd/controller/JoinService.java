package com.fd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fd.command.Command;
import com.fd.model.MemberDAO;
import com.fd.model.MemberVO;

public class JoinService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String email = request.getParameter("email");

		System.out.println(id + "/" + pw + "/" + name + "/" + tel + "/" + address + "/" + email);

		MemberVO vo = new MemberVO(id, pw, name, tel, address, email);

		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(vo);

		System.out.println(cnt);
		if (cnt > 0) {
			System.out.println("회원가입 성공");
			return "index.jsp";
		} else {
			System.out.println("회원가입 실패");
			return "index.jsp";
		}
	}

}
