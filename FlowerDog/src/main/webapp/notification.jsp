<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./css/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog</title>   
    <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
    <script src="./javascript/main.js"></script>
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
                    <a href="./sign-up.jsp"><div>회원가입</div></a>
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
                <a href="#"><ol><i class="fa-solid fa-magnifying-glass"></i>반려동물 찾기</ol></a>
            </div>
            <div class="side-bar__menu">
                <a href="./my-page.jsp"><h2>마이페이지</h2></a>
                <a href="#"><ol><i class="fa-solid fa-dog"></i>반려동물</ol></a>
                <a href="#"><ol><i class="fa-solid fa-user"></i>내정보</ol></a>
                <a href="#"><ol><i class="fa-solid fa-calendar-days"></i>다이어리</ol></a>
            </div>
            <div class="side-bar__login">
                <a href="./sign-up.jsp"><div>회원가입</div></a>
                <a href="./login.jsp"><div>로그인</div></a>
            </div>
        </div>
        <!-- 메인컨텐츠 -->
        <div class="body-contents">
            <!-- 왼쪽 고정메뉴 -->
            <div class="body-content__side-menu">
                <h2>커뮤니티</h2>
                <a href="./notification.jsp"><ol>공지사항</ol></a>
                <a href="./community.jsp"><ol>자유게시판</ol></a>
                <a href="./search-pet.jsp"><ol>반려동물 찾기</ol></a>
            </div>
            <div class="body-contents__board">
                <form action="">
                    <div class="board__head"><h2>공지사항</h2></div>
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
                        <div class="board__list">
                            <div class="list-num">1</div>
                            <div class="list-title">한시간에 한번씩은 바람쐬러가기</div>
                            <div class="list-name">관리자</div>
                            <div class="list-date">2023-08-30</div>
                            <div class="list-count">9999</div>
                        </div>
                        <!-- 게시판 콘텐츠 +  -->
                        <div class="board__list">
                            <div class="list-num">2</div>
                            <div class="list-title">API 적용방법 찾아보기</div>
                            <div class="list-name">관리자</div>
                            <div class="list-date">2023-08-31</div>
                            <div class="list-count">9999</div>
                        </div>
                    </div>
                    <!-- 공지사항 글쓰기 (Admin) -->
                    <div class="board__btn">
                        <button><a href="./board-writing.jsp">글쓰기</a></button>
                    </div>
                    <!-- 글 검색 -->
                    <div class="board__search">
                        <input type="search" name="search" placeholder="검색어를 입력하세요">
                        <a class="search-btn" href="#">검색</a>
                    </div>
                    <!-- 게시판 페이징 -->
                    <div class="board__page">
                        <ul class="board__page-list">
                            <li><a href="#"><i class="fa-solid fa-angles-left"></i></a></li>
                            <li><a href="#"><i class="fa-solid fa-angle-left"></i></a></li>
                            <li><a href="#" class="now-page">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><i class="fa-solid fa-angle-right"></i></a></li>
                            <li><a href="#"><i class="fa-solid fa-angles-right"></i></a></li>
                        </ul>
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

