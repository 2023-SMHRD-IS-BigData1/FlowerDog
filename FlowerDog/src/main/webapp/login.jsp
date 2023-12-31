<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FL Dog - 로그인</title>
        <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
        <script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
        <script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>
        <link rel="stylesheet" href="./css/style.css">
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
                <a href="./map.jsp"><ol><i class="fa-solid fa-map-location-dot"></i>산책지도</ol></a>
                <a href="./map-facility.jsp"><ol><i class="fa-solid fa-bell-concierge"></i>편의시설</ol></a>
            </div>
            <div class="side-bar__menu">
                <h2>커뮤니티</h2>
                <a href="./notification.jsp"><ol><i class="fa-solid fa-bullhorn"></i>공지사항</ol></a>
                <a href="./community.jsp"><ol><i class="fa-solid fa-comment"></i>자유게시판</ol></a>
            </div>
            <div class="side-bar__menu">
                <h2>마이페이지</h2>
                <a href="./my-page-index.jsp"><ol><i class="fa-solid fa-user"></i>내정보</ol></a>
                <a href="./pet-page-index.jsp"><ol><i class="fa-solid fa-dog"></i>반려동물</ol></a>
            </div>
            <div class="side-bar__menu-my">
                <a href="./diary.jsp"><ol><i class="fa-solid fa-calendar-days"></i>다이어리</ol></a>
            </div>
            <div class="side-bar__login">
                <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                <a href="./login.jsp"><div>로그인</div></a>
            </div>
        </div>
            <!-- 메인컨텐츠 -->
            <div class="body-contents">
                <div class="body-contents__login">
                    <form action="LoginService" method="post">
                        <div class="login-box">
                            <div class="login-box__id-wrap">
                                <i class="fa-regular fa-user"></i>
                                <input type="text" placeholder="아이디" name="user_id">
                            </div>
                            <div class="login-box__pw-wrap">
                                <i class="fa-solid fa-lock"></i>
                                <input type="password" placeholder="비밀번호" name="user_pw">
                            </div>
                            <div class="login-box__check">
                                <div class="check-id-save">
                                    <input id="checkbox-id" type="checkbox" name="save-id">
                                    <label for="checkbox-id"><span>아이디 저장</span></label>
                                </div>
                                <div class="check-login">
                                    <input id="checkbox-login" type="checkbox" name="auto-login">
                                    <label for="checkbox-login">자동 로그인</label>
                                </div>
                            </div>
                            <input type="submit" value="Log in" class="login-box__login" id="login-box__login">
                            <label for="login-box__login"></label>
                            <!-- 소셜 로그인 API -->
                            <!-- 네이버 API -->
                            <div onClick="onSocialClick()" class="login-box__social for-naver" name="naver">
                                <a class="login-box__social-btn"
                                    href="#">
                                    <img class="social-icon" src="https://m.clove.kr/wJk/img/sns/naver_icon.png"
                                        alt="">
                                    <div class="social-text">네이버로 시작하기</div>
                                </a>
                            </div>
                            <!-- 카카오톡 API -->
                            <div onClick="onSocialClick()" class="login-box__social for-kakao" name="kakao">
                                <a class="login-box__social-btn"
                                    href="#">
                                    <img class="social-icon"
                                        src="https://play-lh.googleusercontent.com/Ob9Ys8yKMeyKzZvl3cB9JNSTui1lJwjSKD60IVYnlvU2DsahysGENJE-txiRIW9_72Vd"
                                        alt="">
                                    <div class="social-text">카카오로 시작하기</div>
                                </a>
                                <!-- 구글 API -->
                            </div>
                            <div onClick="onSocialClick()" class="login-box__social for-google" name="google">
                                <a class="login-box__social-btn"
                                    href="#">
                                    <img class="social-icon"
                                        src="https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=w240-h480-rw"
                                        alt="">
                                    <div class="social-text">Google로 시작하기</div>
                                </a>
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