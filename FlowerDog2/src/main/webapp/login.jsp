<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog - Login</title>
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
                                <a href="#"><p>편의시설</p></a>
                            </div>
                        </div>
                        <div class="main-menu__list4">
                            <a href="./notification.jsp"><span>커뮤니티</span></a>
                            <div class="list-dropdown">
                                <a href="./notification.jsp"><p>공지사항</p></a>
                                <a href="./community.jsp"><p>자유게시판</p></a>
                            </div>
                        </div>
                        <div class="main-menu__list5">
                            <a href="./my-page.jsp"><span>마이페이지</span></a>
                            <div class="list-dropdown">
                                <a href="#"><p>반려동물</p></a>
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
                <!-- <a href="#"><ol><i class="fa-solid fa-house-medical"></i>의료시설</ol></a> -->
                <a href="#"><ol><i class="fa-solid fa-bell-concierge"></i>편의시설</ol></a>
            </div>
            <div class="side-bar__menu">
                <a href="./notification.jsp"><h2>커뮤니티</h2></a>
                <a href="./notification.jsp"><ol><i class="fa-solid fa-bullhorn"></i>공지사항</ol></a>
                <a href="./community.jsp"><ol><i class="fa-solid fa-comment"></i>자유게시판</ol></a>
            </div>
            <div class="side-bar__menu">
                <a href="./my-page.jsp"><h2>마이페이지</h2></a>
                <a href="#"><ol><i class="fa-solid fa-dog"></i>반려동물</ol></a>
                <a href="#"><ol><i class="fa-solid fa-calendar-days"></i>다이어리</ol></a>
            </div>
            <div class="side-bar__menu-my">
                <a href="#"><ol><i class="fa-solid fa-user"></i>내정보</ol></a>
            </div>
            <div class="side-bar__login">
                <a href="./sign-up-index.jsp"><div>회원가입</div></a>
                <a href="./login.jsp"><div>로그인</div></a>
            </div>
        </div>
        <!-- 메인컨텐츠 -->
        <div class="body-contents">
            <div class="body-contents__login">
                <form action="">
                    <div class="login-box">
                        <div class="login-box__id-wrap">
                            <i class="fa-regular fa-user"></i>
                            <input type="text"  placeholder="아이디" name="id">
                        </div>
                        <div class="login-box__pw-wrap">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password"  placeholder="비밀번호" name="pw">
                        </div>
                        <div class="login-box__check">
                            <div class="check-id">
                                <input id="checkbox-id" type="checkbox" name="save-id">
                                <label for="checkbox-id"><span>아이디 저장</span></label>
                            </div>
                            <div class="check-login">
                                <input id="checkbox-login" type="checkbox" name="auto-login">
                                <label for="checkbox-login">자동 로그인</label>
                            </div>
                        </div>
                        <div class="login-box__login">Log In</div>
                        <!-- 소셜 로그인 API -->
                        <div class="login-box__social">
                            <a href="#"><img class="social-icon" src="https://play-lh.googleusercontent.com/Ob9Ys8yKMeyKzZvl3cB9JNSTui1lJwjSKD60IVYnlvU2DsahysGENJE-txiRIW9_72Vd" alt=""></a>
                            <a href="#"><img class="social-icon" src="https://play-lh.googleusercontent.com/jYtnK__ibJh9emODIgTyjZdbKym1iAj4RfoVhQZcfbG-DuTSHR5moHVx9CQnqg1yoco9" alt=""></a>
                            <a href="#"><img class="social-icon" src="https://play-lh.googleusercontent.com/PCpXdqvUWfCW1mXhH1Y_98yBpgsWxuTSTofy3NGMo9yBTATDyzVkqU580bfSln50bFU" alt=""></a>
                            <a href="#"><img class="social-icon" src="https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1=w240-h480-rw" alt=""></a>
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
</html>

