
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.fd.model.PetDAO"%>
<%@page import="com.fd.model.PetVO"%>
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
		if(loginVO == null){response.sendRedirect("login.jsp");}
		List<PetVO> pet_list = null;
		if(loginVO != null){
		pet_list = new PetDAO().showpet(loginVO.getUser_id());
		System.out.print(pet_list.size());
		}
%>
    <div class="main">
        <!-- 상단 고정바 -->
        <div class="head-top">
            <div class="head-top__main">
                <div class="head-top__main-title">
                    <a href="./index-login.jsp">
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
                    <div class="side-menu__head"><h2>마이페이지</h2></div>
                    <a href="./my-page-index.jsp">
                        <ol>내정보 관리</ol>
                    </a>
                    <a href="./pet-page-index.jsp">
                        <ol>반려동물 관리</ol>
                    </a>
                </div>
            </div>
            <div class="body-contents__board">
                <form action="">
                    <div class="body-contents__board-mypage">
                    <%if(loginVO !=null){ %>
                       <% for(int i= 0 ; i< pet_list.size(); i++ ){ %>
                        <ul class="mypage__petlist">
                            <!-- 펫 헤드 -->
                            <div class="board-mypage__pet">
                                <!-- 반려동물 이름 -->
                                <div class="mypage__petname">
                                    <div class="petname-text"><%=pet_list.get(i).getPet_id() %></div>
                                </div>
                                <!-- 프로필사진 -->
                                <div class="mypage__picture">
                                    <img src="./pet_file/<%=pet_list.get(i).getPet_picture() %>" alt="" class="picture-box" />
                                </div>
                            </div>
                            <!-- 견종 -->
                            <ul class="board-mypages__pet">
                                <i class="fa-solid fa-dog"></i>
                                <div class="mypages__box">
                                    <div class="mypages-title">견종</div>
                                    <div class="mypages-data"><%=pet_list.get(i).getPet_type() %></div>
                                </div>
                            </ul>
                            <!-- 나이 -->
                            <ul class="board-mypages__pet">
                                <i class="fa-solid fa-user"></i>
                                <div class="mypages__box">
                                    <div class="mypages-title">나이</div>
                                    <div class="mypages-data"><%=pet_list.get(i).getPet_age() %></div>
                                </div>
                            </ul>
                            <!-- 성별 -->
                            <ul class="board-mypages__pet">
                                <i class="fa-solid fa-venus-mars"></i>
                                <div class="mypages__box">
                                    <div class="mypages-title">성별</div>
                                    <div class="mypages-data"><%=pet_list.get(i).getPet_gender() %></div>
                                </div>
                            </ul>
                            <!-- 입양일자 -->
                            <ul class="board-mypages__pet">
                                <i class="fa-solid fa-calendar-days"></i>
                                <div class="mypages__box">
                                    <div class="mypages-title">입양일자</div>
                                    <div class="mypages-data"><%=pet_list.get(i).getPet_date() %></div>
                                </div>
                            </ul>
                            <!-- 히스토리 -->
<!--                             <ul class="board-mypages__pet">
                                <i class="fa-solid fa-calendar-days"></i>
                                <div class="mypages__box">
                                    <div class="mypages-title">히스토리</div>
                                    <div class="mypages-data">반려동물에 대한 히스토리 종합(DB)</div>
                                </div>
                            </ul> -->
                            <!-- 수정 삭제 버튼 -->
                             <% String petId = pet_list.get(i).getPet_id(); %>
                            <ul class="board-mypages__pet">
                                <div class="mypages__box-pet">
                                    <button class="pet__fix-btn"><a href="./pet-page-fix.jsp?i=<%=i%>">수정하기</a></button>
                                    <button class="pet__del-btn"><a href="PetdeleteService?petId=<%=petId%>">삭제</a></button>
                                </div>
                            </ul>
                        </ul>
                        <%}}%>
                        <!-- 반려동물 추가 박스 -->
                        <a href="./pet-page.jsp">
                            <div class="board-mypages__pet-add">
                                <i class="fa-regular fa-square-plus"></i>
                                <div class="pet-add__text">반려동물 추가하기</div>
                            </div>
                        </a>
                    </div>
                    <div class="mypages-pet__nullbox"></div>
                </form>
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