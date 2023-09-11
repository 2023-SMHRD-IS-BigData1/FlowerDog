<%@page import="com.fd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog - 내정보</title>
    <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
	<%
	MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
	%>
    <div class="main">
        <!-- 상단 고정바 -->
        <div class="head-top">
            <div class="head-top__main">
                <div class="head-top__main-title">
                    <a href="./index.jsp">
                        <img src="https://i.pinimg.com/564x/9c/b9/c5/9cb9c5c51a5df9a562246a471c442fa4.jpg" alt="">
                        <span>꽃길만 걷개</span>
                    </a>
                </div>
                <div class="head-top__main-menu">
                    <ul class="main-menu__list">
                        <ul class="main-menu__list-title-non">
                        </ul>
                        <ul class="main-menu__list-title">
                            <a href="./map.jsp"><div class="list-title__text">산책하개</div></a>
                            <a href="./map.jsp">
                                <ul class="list-dropdown"><div class="list-content">산책지도</div></ul>
                            </a>
                            <a href="./map-facility.jsp">
                                <ul class="list-dropdown"><div class="list-content">편의시설</div></ul>
                            </a>
                        </ul>
                        <ul class="main-menu__list-title">
                            <a href="./notification.jsp"><div class="list-title__text">커뮤니티</div></a>
                            <a href="./notification.jsp">
                                <ul class="list-dropdown"><div class="list-content">공지사항</div></ul>
                            </a>
                            <a href="./community.jsp">
                                <ul class="list-dropdown"><div class="list-content">자유게시판</div></ul>
                            </a>
                        </ul>
                        <ul class="main-menu__list-title">
                            <a href="./my-page-index.jsp"><div class="list-title__text">마이페이지</div></a>
                            <a href="./my-page-index.jsp">
                                <ul class="list-dropdown"><div class="list-content">내정보 관리</div></ul>
                            </a>
                            <a href="./pet-page-index.jsp">
                                <ul class="list-dropdown"><div class="list-content">반려동물 관리</div></ul>
                            </a>
                        </ul>
                        <ul class="main-menu__list-title-non">
                            <a href="./diary.jsp"><div class="list-title__text">다이어리</div></a>
                        </ul>
                    </ul>
                    <div class="main-menu__list-min">
                        <button onClick="sideMenu()"><svg width="40" height="40" viewBox="0 0 16 16"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill="#000000" fill-rule="evenodd"
                                    d="M0 3.75A.75.75 0 0 1 .75 3h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 3.75ZM0 8a.75.75 0 0 1 .75-.75h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 8Zm.75 3.5a.75.75 0 0 0 0 1.5h14.5a.75.75 0 0 0 0-1.5H.75Z"
                                    clip-rule="evenodd" />
                            </svg></button>
                    </div>
                </div>
                <div class="head-top__login">
                    <a href="./sign-up-index.jsp">
                        <div>회원가입</div>
                    </a>
                    <a href="./login.jsp">
                        <div>로그인</div>
                    </a>
                </div>
            </div>
        </div>
        <!-- 사이드바 -->
        <div class="main-menu__side-bar">
            <div class="side-bar__menu">
                <h2>산책하개</h2>
                <a href="./map.jsp">
                    <ol><i class="fa-solid fa-map-location-dot"></i>산책지도</ol>
                </a>
                <a href="./map-facility.jsp">
                    <ol><i class="fa-solid fa-bell-concierge"></i>편의시설</ol>
                </a>
            </div>
            <div class="side-bar__menu">
                <h2>커뮤니티</h2>
                <a href="./notification.jsp">
                    <ol><i class="fa-solid fa-bullhorn"></i>공지사항</ol>
                </a>
                <a href="./community.jsp">
                    <ol><i class="fa-solid fa-comment"></i>자유게시판</ol>
                </a>
            </div>
            <div class="side-bar__menu">
                <h2>마이페이지</h2>
                <a href="./my-page-index.jsp">
                    <ol><i class="fa-solid fa-user"></i>내정보</ol>
                </a>
                <a href="./pet-page-index.jsp">
                    <ol><i class="fa-solid fa-dog"></i>반려동물</ol>
                </a>
            </div>
            <div class="side-bar__menu-my">
                <a href="./diary.jsp">
                    <ol><i class="fa-solid fa-calendar-days"></i>다이어리</ol>
                </a>
            </div>
            <div class="side-bar__login">
                <a href="./sign-up-index.jsp">
                    <div>회원가입</div>
                </a>
                <a href="./login.jsp">
                    <div>로그인</div>
                </a>
            </div>
        </div>
        <!-- 메인컨텐츠 -->
        <div class="body-contents">
            <!-- 왼쪽 고정메뉴 -->
            <div class="body-content__side-menu">
                <div class="side-menu__top"></div>
                <div class="side-menu">
                    <div class="side-menu__head"><h2>마이페이지</h2></div>
                    <a href="./my-page-index.jsp">
                        <ol>내정보 관리</ol>
                    </a>
                    <a href="./pet-page.jsp">
                        <ol>반려동물 관리</ol>
                    </a>
                </div>
            </div>
            <div class="body-contents__board">
                <form action="">
                    <div class="body-contents__board-mypage">
                        <!-- 정보수정  -->
                        <div class="board-mypage">
                            <div class="mypage__head">내정보</div>
                            <!-- 빈공간 -->
                            <div class="mypage__nickname"></div>
                            <!-- 프로필사진 -->
                            <div class="mypage__picture">
                             <%if (loginVO == null) { %>
                                <img src="" alt="" class="picture-box" />
                             <%}else{ %>
                                <img src=".user_pofile_file/<%=loginVO.getUser_picture()%>" alt="" class="picture-box" />
                             <% } %>
                                <!-- 닉네임 -->
                                <div class="mypages__nickname">
                                <% if (loginVO == null) {%>
                                    <div class="nickname__text">닉네임(DB)</div>
                                    <%}else{ %>
                                    <div class="nickname__text"><%=loginVO.getUser_nickname()%></div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <!-- 아이디 -->
                        <div class="board-mypages">
                            <i class="fa-solid fa-user"></i>
                            <div class="mypages__box">
                                <div class="mypages-title">아이디</div>
                                <% if (loginVO == null) {%>
                                <div class="mypages-data">아이디(DB)</div>
                                 <%}else{ %>
                                <div class="mypages-data"><%=loginVO.getUser_id() %></div>
                                 <%} %>
                            </div>
                        </div>
                        <!-- 성별 -->
                        <div class="board-mypages">
                            <i class="fa-solid fa-venus-mars"></i>
                            <div class="mypages__box">
                                <div class="mypages-title">성별</div>
                                  <% if (loginVO == null) {%>
                                <div class="mypages-data">성별(DB)</div>
                                  <%}else{ %>
                                <div class="mypages-data"><%=loginVO.getUser_gender() %></div>
                                 <%} %>
                            </div>
                        </div>
                        <!-- 전화번호 -->
                        <div class="board-mypages">
                            <i class="fa-solid fa-mobile-screen-button"></i>
                            <div class="mypages__box">
                                <div class="mypages-title">전화번호</div>
                              <% if (loginVO == null) {%>
                                <div class="mypages-data">000-0000-0000(DB)</div>
                                  <%}else{ %>
                                <div class="mypages-data"><%=loginVO.getUser_tel()%></div>
                                 <%} %>
                            </div>
                        </div>
                        <!-- 주소 -->
                        <div class="board-mypages">
                            <i class="fa-solid fa-address-book"></i>
                            <div class="mypages__box">
                                <div class="mypages-title">주소</div>
                                 <% if (loginVO == null) {%>
                                <div class="mypages-data">main_address(DB)</div>
                                <div class="mypages-data">sub_address(DB)</div>
                                 <%}else{ %>
                                <div class="mypages-data"><%=loginVO.getMain_address() %></div>
                                <div class="mypages-data"><%=loginVO.getSub_address() %></div>
                                 <%} %>
                            </div>
                        </div>
                        <!-- 이메일 -->
                        <div class="board-mypages">
                            <i class="fa-solid fa-envelope"></i>
                            <div class="mypages__box">
                                <div class="mypages-title">이메일</div>
                                 <% if (loginVO == null) {%>
                                <div class="mypages-data">xxxxxxxx@gmail.com(DB)</div>
                                 <%}else{ %>
                                <div class="mypages-data"><%=loginVO.getUser_email() %></div>
                                 <%} %>
                            </div>
                        </div>
                        <!-- 업데이트 버튼 -->
                        <div class="mypages__btn">
                            <div class="mypage__btn-box1"><a href="./my-page.jsp">개인정보수정</a></div>
                            <div class="mypage__btn-box2"><a href="UserdeleteService?user_id=<%=loginVO.getUser_id()%>">회원탈퇴</a></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- TOP 버튼 -->
        <div class="top-button">
            <a href="#"><i class="fa-solid fa-angle-up fa-2xl"></i></a>
        </div>
    </div>
</body>
<script type="text/javascript" src="./javascript/main.js"></script>

</html>