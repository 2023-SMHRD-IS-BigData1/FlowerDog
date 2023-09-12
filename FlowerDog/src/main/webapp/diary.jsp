<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog - 다이어리</title>
    <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="./fullcalendar/main.css">
    <script src="./fullcalendar/main.js"></script>

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
        <div class="body-contents__calendar">
            <!-- 왼쪽 고정메뉴 -->
            <!-- <div class="body-content__side-menu"> -->
                    <!-- 이벤트 추가 -->
                    <!-- <div id='external-events'>
                        <p><strong>이벤트 추가</strong></p>

                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 1</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 2</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 3</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 4</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 5</div>
                        </div>
                    </div> -->
            <!-- </div> -->
            <form action="">
                <!-- <div class="calendar__head">
                    <h2>다이어리</h2>
                </div> -->
                <div class="board__calendar">
                    <div id='calendar'></div>
                </div>
                <div class="calendar-board">
                    <div class="calendar-head"><input type="text" class="calendar-board__head" name="calendar-board__head" placeholder="제목"></div>
                    <div class="calendar-day">
                        <input type="text" class="calendar-board__sday" name="calendar-board__sday" placeholder="시작일자">
                        <input type="text" class="calendar-board__eday" name="calendar-board__eday" placeholder="종료일자">
                    </div>
                    <div class="calendar-content"><textarea name="calendar-board__content" id="calendar-board__content" placeholder="내용" cols="40" rows="19"></textarea></div>
                    <div class="calendar-color">
                        <div class="calendar-color__back">배경색상 <input type="color" class="calendar-color__back"></div>
                        <div class="calendar-color__font">글자색상 <input type="color" class="calendar-color__font"></div>
                    </div>
                    <div class="calendar-btn__write"><input type="submit" class="calendar-board__btn" value="작성하기"></div>
                    <div class="calendar-btn__del"><input type="submit" class="calendar-board__btn" value="일정삭제"></div>
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
<script type="text/javascript" src="./javascript/calendar.js"></script>

</html>