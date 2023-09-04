<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog - 회원가입</title>
    <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
    <script src="./javascript/main.js"></script>
    <script src="./jquery/jquery-3.7.1.js"></script>
	<script src="./jquery/jquery-3.7.1.min.js"></script>
</head>
<body>
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
                    <div class="main-menu__list">
                        <div class="main-menu__list1">
                        </div>
                        <div class="main-menu__list2">
                        </div>
                        <div class="main-menu__list3">
                            <a href="./map.jsp"><span>산책하개</span></a>
                            <div class="list-dropdown">
                                <a href="#"><p>산책지도</p></a>
                                <a href="#"><p>의료시설</p></a>
                                <a href="#"><p>펫서비스</p></a>
                            </div>
                        </div>
                        <div class="main-menu__list4">
                            <a href="./notification.jsp"><span>커뮤니티</span></a>
                            <div class="list-dropdown">
                                <a href="./notification.jsp"><p>공지사항</p></a>
                                <a href="./community.jsp"><p>자유게시판</p></a>
                                <a href="./search-pet.jsp"><p>반려동물 찾기</p></a>
                            </div>
                        </div>
                        <div class="main-menu__list5">
                            <a href="./my-page.jsp"><span>마이페이지</span></a>
                            <div class="list-dropdown">
                                <a href="#"><p>반려동물</p></a>
                                <a href="#"><p>내정보</p></a>
                                <a href="#"><p>다이어리</p></a>
                            </div>
                        </div>
                    </div>
                    <div class="main-menu__list-min">
                        <button onClick="sideMenu()"><svg width="40" height="40" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#000000" fill-rule="evenodd" d="M0 3.75A.75.75 0 0 1 .75 3h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 3.75ZM0 8a.75.75 0 0 1 .75-.75h14.5a.75.75 0 0 1 0 1.5H.75A.75.75 0 0 1 0 8Zm.75 3.5a.75.75 0 0 0 0 1.5h14.5a.75.75 0 0 0 0-1.5H.75Z" clip-rule="evenodd"/>
                        </svg></button>
                    </div>
                </div>
                <div class="head-top__login">
                    <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                    <a href="./login.jsp"><div>로그인</div></a>
                </div>
            </div>
        </div>
        <!-- 사이드바 -->
        <div class="main-menu__side-bar">
            <div class="side-bar__menu">
                <a href="./map.jsp"><h2>산책하개</h2></a>
                <a href="#"><ol><i class="fa-solid fa-map-location-dot"></i>산책지도</ol></a>
                <a href="#"><ol><i class="fa-solid fa-house-medical"></i>의료시설</ol></a>
                <a href="#"><ol><i class="fa-solid fa-bell-concierge"></i>펫서비스</ol></a>
            </div>
            <div class="side-bar__menu">
                <a href="./notification.jsp"><h2>커뮤니티</h2></a>
                <a href="./notification.jsp"><ol><i class="fa-solid fa-bullhorn"></i>공지사항</ol></a>
                <a href="./community.jsp"><ol><i class="fa-solid fa-comment"></i>자유게시판</ol></a>
                <a href="./search-pet.jsp"><ol><i class="fa-solid fa-magnifying-glass"></i>반려동물 찾기</ol></a>
            </div>
            <div class="side-bar__menu">
                <a href="./my-page.jsp"><h2>마이페이지</h2></a>
                <a href="#"><ol><i class="fa-solid fa-dog"></i>반려동물</ol></a>
                <a href="#"><ol><i class="fa-solid fa-user"></i>내정보</ol></a>
                <a href="#"><ol><i class="fa-solid fa-calendar-days"></i>다이어리</ol></a>
            </div>
            <div class="side-bar__login">
                <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                <a href="./login.jsp"><div>로그인</div></a>
            </div>
        </div>
        <!-- 메인컨텐츠 -->
        <div class="body-contents">
            <div class="body-contents__sign-up">
                <form action="">
                    <div class="sign-up__title">Sign Up</div>
                    <ol class="sign-up__input">아이디 : <input type="text"  placeholder="아이디" name="id"></ol>
                    <!-- <button class="sign-up__input-id">중복확인</button> -->
                    <ol class="sign-up__input">비밀번호 : <input type="password"  placeholder="비밀번호" name="pw"></ol>
                    <ol class="sign-up__input">비밀번호 확인 : <input type="password"  placeholder="비밀번호 확인" name="pw"></ol>
                    <ol class="sign-up__input">이름 : <input type="text"  placeholder="이름" name="name"></ol>
                    <ol class="sign-up__input">전화번호 : <input type="text"  placeholder="전화번호" name="tel"></ol>
                    <ol class="sign-up__input">주소 : <input type="text"  placeholder="집주소" name="address"></ol>
                    <ol class="sign-up__input">이메일 : <input type="text"  placeholder="email" name="email"></ol>
                    <ol class="sign-up__input-btn"><input type="submit" value="회원가입"></ol>
                </form>
            </div>
        </div>
        <!-- TOP 버튼 -->
        <div class="top-button">
            <a href="#"><i class="fa-solid fa-angle-up fa-2xl"></i></a>
        </div>
    </div>
</body>
</html>

