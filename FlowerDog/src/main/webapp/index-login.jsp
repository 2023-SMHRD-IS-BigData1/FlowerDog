<%@page import="com.fd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>FL Dog</title>
      <script
        src="https://kit.fontawesome.com/d2846f63b1.js"
        crossorigin="anonymous"
      ></script>
      <script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
      <script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
      <link rel="stylesheet" href="./css/jquary-sakura.css"/>
      <link rel="stylesheet" href="./css/style.css" />
    </head>
    <body>
    <%
    MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); 
    %>
      <div id="mouse-cursor"></div>
  
  		<div class="bottm-img">
  			<img alt="" src="https://i.pinimg.com/originals/92/13/41/9213415b27be022fdcab9ff7f21fa0b6.gif">
  			<img alt="" src="https://i.pinimg.com/originals/92/13/41/9213415b27be022fdcab9ff7f21fa0b6.gif">
  		</div>
  
  
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
        <div class="main-menu__side-bar index__side-bar">
          <div class="side-bar__menu">
            <h2>산책하개</h2>
            <a href="./map.jsp"
              ><ol>
                <i class="fa-solid fa-map-location-dot"></i
                >산책지도
              </ol></a
            >
            <a href="./map-facility.jsp"
              ><ol>
                <i class="fa-solid fa-bell-concierge"></i
                >편의시설
              </ol></a
            >
          </div>
          <div class="side-bar__menu">
            <h2>커뮤니티</h2>
            <a href="./notification.jsp"
              ><ol>
                <i class="fa-solid fa-bullhorn"></i
                >공지사항
              </ol></a
            >
            <a href="./community.jsp"
              ><ol>
                <i class="fa-solid fa-comment"></i
                >자유게시판
              </ol></a
            >
          </div>
          <div class="side-bar__menu">
            <h2>마이페이지</h2>
            <a href="./my-page-index.jsp"
              ><ol>
                <i class="fa-solid fa-user"></i
                >내정보
              </ol></a
            >
            <a href="./pet-page-index.jsp"
              ><ol>
                <i class="fa-solid fa-dog"></i
                >반려동물
              </ol></a
            >
          </div>
          <div class="side-bar__menu-my">
            <a href="./diary.jsp"
              ><ol>
                <i class="fa-solid fa-calendar-days"></i
                >다이어리
              </ol></a
            >
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
          <div class="body-contents__banner">
            <div class="banner-top">
              <img src="https://g-grafolio.pstatic.net/20211109_223/16364280226413EMCQ_GIF/%C5%E4%B4%DA%C5%E4%B4%DA1.gif" alt=""/>
            </div>
          </div>
          <div class="body-contents__text2"></div>
          <div class="body-contents__banner">
            <div class="banner-top">
              <!-- 지도 이미지 넣기 -->
              <img src="https://g-grafolio.pstatic.net/20211109_223/16364280226413EMCQ_GIF/%C5%E4%B4%DA%C5%E4%B4%DA1.gif" alt=""/>
            </div>
          </div>
          <div class="body-contents__text">
            <div class="contents__text">
              <div class="text-header">주변의 시설 및 산책장소를 한눈에</div>
              <div class="text-content">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                하나하나 검색하며 찾아보기는 이제 그만!<br>
                장소를 모아서 한눈에 보고 방문하기 쉽게 내 주변지도에 표시해드려요
              </div>
            </div>
          </div>
          <div class="body-contents__banner">
            <div class="banner-top">
              <!-- 캘린더 이미지 넣기 -->
              <img src="https://g-grafolio.pstatic.net/20211109_223/16364280226413EMCQ_GIF/%C5%E4%B4%DA%C5%E4%B4%DA1.gif" alt=""/>
            </div>
          </div>
        </div>
        <div class="body-contents__text">
          <div class="contents__text">
            <div class="text-header">반려동물과의 추억을 한눈에</div>
            <div class="text-content">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              따로 적어주지 않으면 헷갈리던 일정<br>
              반려동물과 함께 방문한 장소와 예방접종 및 앞으로의 일정을 알려드려요
            </div>
          </div>
        </div>
        <!-- 빈공간 -->
        <div class="body-contents__text2"></div>
        </div>
        <!-- TOP 버튼 -->
        <div class="top-button">
          <a href="#"><i class="fa-solid fa-angle-up fa-2xl"></i></a>
        </div>
      </div>
      <footer>
        <div class="footer-text">@2023 Flower Dog</div>
        <div class="footer-text"><a href="https://github.com/2023-SMHRD-IS-BigData1/FlowerDog"><img src="https://upload.wikimedia.org/wikipedia/commons/c/c2/GitHub_Invertocat_Logo.svg" alt="">@github</a></div>
      </footer>
    </body>
    <script type="text/javascript" src="./javascript/main.js"></script>
    <script type="text/javascript" src="./javascript/jquary-sakura.js"></script>
    <script>
      $(window).load(function () {
          $('body').sakura();
      });
      </script>
  </html>
  