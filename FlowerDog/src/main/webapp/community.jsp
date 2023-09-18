<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.fd.model.BoardDAO"%>
<%@page import="com.fd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.fd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FL Dog - 자유게시판</title>
<script src="https://kit.fontawesome.com/d2846f63b1.js"
	crossorigin="anonymous"></script>
<script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
<script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<%
	MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
	if (loginVO == null){response.sendRedirect("login.jsp");}
	List<BoardVO> list;
	
	 // 자유 게시판 전체 리스트
	List<BoardVO> free_list = new BoardDAO().showFree();
	 
	 // 자유게시판 검색결과 (제목, 내용, 작성자 ) 일치 리스트
	List<BoardVO> search_list = (List<BoardVO>) request.getAttribute("search_list");
	System.out.println("community  검색 한 결과 : " + search_list);
	
	if (search_list == null) {
		list = free_list;
	} else {
		list = search_list;
	}
	
	// 페이징 
	int pageNum;
	if (request.getParameter("page_num") == null){
		pageNum = 1; // 초기 페이지 설정
	}else{
		pageNum = Integer.parseInt(request.getParameter("page_num")); // 받아온 페이지
	}
	System.out.println("받아온 현재페이지"+pageNum);
	int nowPage = pageNum; // 현재페이지	
	

	int endPage; // 리스트 페이지의 갯수가 몇개 나오는지? => 끝 페이지 결정
	if(list.size()%10 != 0){
		endPage = list.size()/5 + 1;
	}else{
		endPage = list.size()/5;
	}
	
	// 게시글 시작과 끝 (5 조정)
	int strpost = (nowPage-1)*5 ;
	int endpost;
	
	if(list.size() <= 5){
		endpost = list.size();
	}else if (nowPage!=endPage){ 
		endpost = nowPage*5;
	}else{	
		endpost = (nowPage-1)*5 + list.size()%5;
	}
	
		
	// 하단 페이지 갯수 마크 조정 (5개) 
		int paging;
		if (nowPage+4 < endPage){
			paging= nowPage+4;
		}else{
			paging = endPage;
		}	

	
	%>
	<div class="main">
		<!-- 상단 고정바 -->
		<div class="head-top">
			<div class="head-top__main">
				<div class="head-top__main-title">
					<a href="./index-login.jsp"> <img
						src="https://i.pinimg.com/564x/9c/b9/c5/9cb9c5c51a5df9a562246a471c442fa4.jpg"
						alt=""> <span>꽃길만 걷개</span>
					</a>
				</div>
				<div class="head-top__main-menu">
					<ul class="main-menu__list">
						<ul class="main-menu__list-title-non">
						</ul>
						<ul class="main-menu__list-title">
							<a href="./map.jsp"><div class="list-title__text">산책하개</div></a>
							<a href="./map.jsp">
								<ul class="list-dropdown">
									<div class="list-content">산책지도</div>
								</ul>
							</a>
							<a href="./map-facility.jsp">
								<ul class="list-dropdown">
									<div class="list-content">편의시설</div>
								</ul>
							</a>
						</ul>
						<ul class="main-menu__list-title">
							<a href="./notification.jsp"><div class="list-title__text">커뮤니티</div></a>
							<a href="./notification.jsp">
								<ul class="list-dropdown">
									<div class="list-content">공지사항</div>
								</ul>
							</a>
							<a href="./community.jsp">
								<ul class="list-dropdown">
									<div class="list-content">자유게시판</div>
								</ul>
							</a>
						</ul>
						<ul class="main-menu__list-title">
							<a href="./my-page-index.jsp"><div class="list-title__text">마이페이지</div></a>
							<a href="./my-page-index.jsp">
								<ul class="list-dropdown">
									<div class="list-content">내정보 관리</div>
								</ul>
							</a>
							<a href="./pet-page-index.jsp">
								<ul class="list-dropdown">
									<div class="list-content">반려동물 관리</div>
								</ul>
							</a>
						</ul>
						<ul class="main-menu__list-title-non">
							<a href="./diary.jsp"><div class="list-title__text">다이어리</div></a>
						</ul>
					</ul>
					<div class="main-menu__list-min">
						<button onClick="sideMenu()">
							<svg width="40" height="40" viewBox="0 0 16 16"
								xmlns="http://www.w3.org/2000/svg">
                                <path fill="#000000" fill-rule="evenodd"
									d="M0 3.75A.75.75 0 0 1 .75 3h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 3.75ZM0 8a.75.75 0 0 1 .75-.75h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 8Zm.75 3.5a.75.75 0 0 0 0 1.5h14.5a.75.75 0 0 0 0-1.5H.75Z"
									clip-rule="evenodd" />
                            </svg>
						</button>
					</div>
				</div>
				<div class="head-top__login">
                    <%if(loginVO ==null) {%>
                    <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                    <a href="./login.jsp"><div>로그인</div></a>
                    <%}else{ %>
                     <a href="LogoutService"><div><%=loginVO.getUser_nickname()%> 님 로그아웃</div></a>
                    <%} %>
				</div>
			</div>
		</div>
		<!-- 사이드바 -->
		<div class="main-menu__side-bar">
			<div class="side-bar__menu">
				<h2>산책하개</h2>
				<a href="./map.jsp"><ol>
						<i class="fa-solid fa-map-location-dot"></i>산책지도
					</ol></a> <a href="./map-facility.jsp"><ol>
						<i class="fa-solid fa-bell-concierge"></i>편의시설
					</ol></a>
			</div>
			<div class="side-bar__menu">
				<h2>커뮤니티</h2>
				<a href="./notification.jsp"><ol>
						<i class="fa-solid fa-bullhorn"></i>공지사항
					</ol></a> <a href="./community.jsp"><ol>
						<i class="fa-solid fa-comment"></i>자유게시판
					</ol></a>
			</div>
			<div class="side-bar__menu">
				<h2>마이페이지</h2>
				<a href="./my-page-index.jsp"><ol>
						<i class="fa-solid fa-user"></i>내정보
					</ol></a> <a href="./pet-page.jsp"><ol>
						<i class="fa-solid fa-dog"></i>반려동물
					</ol></a>
			</div>
			<div class="side-bar__menu-my">
				<a href="./diary.jsp"><ol>
						<i class="fa-solid fa-calendar-days"></i>다이어리
					</ol></a>
			</div>
			<div class="side-bar__login">
                    <%if(loginVO ==null) {%>
                    <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                    <a href="./login.jsp"><div>로그인</div></a>
                    <%}else{ %>
                     <a href="LogoutService"><div><%=loginVO.getUser_nickname()%> 님 로그아웃</div></a>
                    <%} %>
			</div>
		</div>
		<!-- 메인컨텐츠 -->
		<div class="body-contents">
			<!-- 왼쪽 고정메뉴 -->
			<div class="body-content__side-menu">
				<div class="side-menu__top"></div>
				<div class="side-menu">
					<div class="side-menu__head">
						<h2>커뮤니티</h2>
					</div>
					<a href="./notification.jsp">
						<ol>공지사항
						</ol>
					</a> <a href="./community.jsp">
						<ol>자유게시판
						</ol>
					</a>
				</div>
			</div>
			<div class="body-contents__board">
				<div class="board-box">
					<div class="board__head">
						<h2>자유게시판</h2>
					</div>
					<div class="board__lists">
						<!-- 게시판 상단 -->
						<div class="board__list list-top">
							<div class="list-num">글번호</div>
							<div class="list-title">제목</div>
							<div class="list-name">작성자</div>
							<div class="list-date">작성일</div>
							<div class="list-count">조회</div>
						</div>
						<!-- 게시판 콘텐츠 +  -->
						<%
						for (int i = strpost; i < endpost; i++) {
						%>
						<div class="board__list">
							<div class="list-num"><%= i +1 %></div>
							<div class="list-title">
								<a href="board-detail.jsp?num=<%=list.get(i).getBoard_num()%>">
									<%=list.get(i).getBoard_tatle()%></a>
							</div>
							<div class="list-name"><%=list.get(i).getUser_id()%></div>
							<div class="list-date"><%=list.get(i).getBoard_date().toString()%></div>
							<div class="list-count"><%=list.get(i).getBoard_count()%></div>
						</div>
						<%}%>
					</div>
					<!-- 글쓰기 (로그인 검증)-->
					<% if (loginVO != null) {%>
					<div class="board__btn">
						<button>
							<a href="./board-writing.jsp">글쓰기</a>
						</button>
					</div>
					<% }%>
					<!-- 글 검색 -->
					<!--   <div class="board__search">
                        <input type="text" name="search" placeholder="검색할 제목을 입력하세요">
                        <a class="search-btn" href="BoardsearchService?">검색</a>
                    </div>   -->

					<form action="BoardsearchService">
						<div class="board__search">
							<select name="search_key">
								<option value="Title">제목</option>
								<option value="Content">내용</option>
								<option value="Name">작성자</option>
							</select> <input type="hidden" value="F" name="bcode"> <input
								type="text" name="search" placeholder="검색어를 입력하세요"> <input
								type="submit" class="search-btn" value="검색">
						</div>
					</form>





					<!-- 게시판 페이징 -->
					<div class="board__page">
						<ul class="board__page-list">
							<li><a href="community.jsp?page_num=1"><i class="fa-solid fa-angles-left"></i></a></li>
							<%if(nowPage !=1){ %>
							<li><a href="community.jsp?page_num=<%=nowPage-1%>"><i class="fa-solid fa-angle-left"></i></a></li>
							<%}else{%>
							<li><a href="community.jsp?page_num=<%=nowPage%>"><i class="fa-solid fa-angle-left"></i></a></li>
							<%} %>
							<li><a href="community.jsp?page_num=<%=nowPage%>" class="now-page"><%=nowPage%></a></li>
							<% 	for(int i = nowPage; i < paging; i++){%>
							<li><a href="community.jsp?page_num=<%=i+1%>"><%=i+1%></a></li>
							<%}
							if(nowPage+1<endPage) {%>
							<li><a href="community.jsp?page_num=<%=nowPage+1%>"><i class="fa-solid fa-angle-right"></i></a></li>				
							<%}else{ %>
							<li><a href="community.jsp?page_num=<%=endPage%>"><i class="fa-solid fa-angle-right"></i></a></li>				
							<%} %>
							<li><a href="community.jsp?page_num=<%=endPage%>"><i class="fa-solid fa-angles-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		      <footer>
        <div class="footer-text">@2023 Flower Dog</div>
        <div class="footer-text"><a href="https://github.com/2023-SMHRD-IS-BigData1/FlowerDog"><img src="https://upload.wikimedia.org/wikipedia/commons/c/c2/GitHub_Invertocat_Logo.svg" alt="">@github</a></div>
      </footer>
		<!-- TOP 버튼 -->
		<div class="top-button">
			<a href="#"><i class="fa-solid fa-angle-up fa-2xl"></i></a>
		</div>
	</div>
</body>
<script type="text/javascript" src="./javascript/main.js"></script>
</html>

