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
	if (loginVO == null){response.sendRedirect("login.jsp");}
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
                    <a href="./pet-page.jsp">
                        <ol>반려동물 관리</ol>
                    </a>
                </div>
            </div>
            <div class="body-contents__board">
                <form action="UserupdateService" method="post" enctype="multipart/form-data">
                    <div class="body-contents__board-mypage">
                        <!-- 정보수정  -->
                        <div class="board-mypage">
                            <div class="mypage__head">개인정보 수정</div>
                            <!-- 닉네임 -->
                            <div class="mypage__nickname">
                                <div>닉네임</div>
                                <input type="text" name="user_nickname" value="<%=loginVO.getUser_nickname() %>" placeholder="<%=loginVO.getUser_nickname() %>" class="user-nickname" 
                                    disabled />
                            </div>
                            <!-- 프로필사진 -->
                            <div class="mypage__picture">
                            <%if (loginVO.getUser_picture() ==null){ %>
                                <img src="https://mblogthumb-phinf.pstatic.net/MjAyMDAyMTBfODAg/MDAxNTgxMzA0MTE3ODMy.ACRLtB9v5NH-I2qjWrwiXLb7TeUiG442cJmcdzVum7cg.eTLpNg_n0rAS5sWOsofRrvBy0qZk_QcWSfUiIagTfd8g.JPEG.lattepain/1581304118739.jpg?type=w800" alt="" class="picture-box"/>
                                <%}else{ %>
                                <img src="./user_file/<%=loginVO.getUser_picture() %>" alt="" class="picture-box"/>
								<%} %>                          
                                <div class="picture-box__input">
                                    <input class="user-picture" value="첨부파일" disabled />
                                    <label for="picture-file">파일찾기</label>
                                    <input accept=".jpg, .png" onchange="PreviewImage();" type="file" name="user_picture" class="user-picture" id="picture-file">
                                </div>
                                <div class="user-picture__text">png, jpg 이미지 파일로 등록해주세요</div>
                            </div>
                        </div>
                        <!-- 비밀번호 -->
                        <div class="board-mypage">
                            <div class="mypage__password">
                                <div>비밀번호</div>
                                <input type="password" name="user_pw" value="<%=loginVO.getUser_pw()%>" placeholder="비밀번호" class="user-password" >
                            </div>
                        </div>
                        <!-- 성별 -->
                        <div class="board-mypage">
                            <div class="mypage__gender">
                                <div>성별</div>
                                <input type="text" name="user_gender" value="<%=loginVO.getUser_gender()%>" placeholder="성별" class="user-gender">
                            </div>
                        </div>
                        <!-- 전화번호 -->
                        <div class="board-mypage">
                            <div class="mypage__tel">
                                <div>전화번호</div>
                                <input type="text" name="user_tel" value="<%=loginVO.getUser_tel()%>" placeholder="전화번호" class="user-tel">
                            </div>
                        </div>
                        <!-- 주소 -->
                        <div class="board-mypage">
                            <div class="mypage__address">
                                <div>주소</div>
                                <!-- 도로명주소 -->
                                <input type="text" name="main_address" value="<%=loginVO.getMain_address()%>" placeholder="도로명주소" class="user-mainaddress">
                                <!-- 상세주소 -->
                                <input type="text" name="sub_address" value="<%=loginVO.getSub_address()%>" placeholder="상세주소" class="user-subaddress">
                            </div>
                        </div>
                        <!-- 이메일 -->
                        <div class="board-mypage">
                            <div class="mypage__email">
                                <div>이메일</div>
                                <input type="text" name="user_email" value="<%=loginVO.getUser_email()%>" placeholder="email" class="user-email">
                            </div>
                        </div>
                        <!-- 업데이트 버튼 -->
                        <div class="board-mypage">
                            <div class="mypage__btn">
                                <input type="submit" value="수정하기" class="mypage__btn-commit">
                                <input type="hidden" value="취소" class="mypage__btn-cancle" >
                            </div>
                        </div>
                    </div>
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