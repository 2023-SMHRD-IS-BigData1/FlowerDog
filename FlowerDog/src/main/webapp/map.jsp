<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.fd.model.FacilityVO"%>
<%@page import="com.fd.model.FacilityDAO"%>
<%@page import="com.fd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FL Dog - 산책지도</title>   
    <script src="https://kit.fontawesome.com/d2846f63b1.js" crossorigin="anonymous"></script>
   <!-- 카카오 맵 api 가져오기 & 팀장 앱키사용중 & 라이브러리 불러오기-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2af6d59c3ca1ab8cfe9b70071384b7ea&libraries=services"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.min.js"></script>
    <script src="./jquery/code.jquery.com_jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<%

MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
if(loginVO == null){response.sendRedirect("login.jsp");}

String address =null ;

if(loginVO !=null){
	address = loginVO.getMain_address();
	System.out.println(address);
}

List<FacilityVO> east_list = new FacilityDAO().park_east();
List<FacilityVO> west_list = new FacilityDAO().park_west();
List<FacilityVO> north_list = new FacilityDAO().park_north();
List<FacilityVO> south_list = new FacilityDAO().park_south();
List<FacilityVO> kwang_list = new FacilityDAO().park_kwang();


 

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
                    <div class="side-menu__head"><h2>산책하개</h2></div>
                    <a href="./map.jsp">
                        <ol>산책지도</ol>
                    </a>
                    <a href="./map-facility.jsp">
                        <ol>편의시설</ol>
                    </a>
                </div>
            </div>
            <div class="body-contents__board">
                <form action="">
                    <div class="board__head"><h2>산책지도</h2></div>
                    <div class="board__maps">
					<!-- 지도크기 지정 -->           
					<div id="map" style="width:100%;height:560px;"></div>
				
				
				
						<script>
						    let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						        mapOption = { 
						            center: new kakao.maps.LatLng(35.1497911, 126.9199378), // 지도의 중심좌표
						            level: 4 // 지도의 확대 레벨
						        };
						    
						    let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						    
							//주소 - 좌표 변환 객체
					   		let geocoder = new kakao.maps.services.Geocoder();
						    
						    
						    // 지도 확대 축소 객체
					   		var zoomControl = new kakao.maps.ZoomControl();
					   		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
						    
						    
					    </script>
						<script>
						
						<% if(address != null && address.contains("북구")){ %>
						 
						<% for (int i = 0 ; i < north_list.size() ; i++ ) { %>
								geocoder.addressSearch('<%=north_list.get(i).getAdress() %>' , function(result, status) {

								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {

								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								        
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });

								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=north_list.get(i).getName() %></div>',
								            clickable: true
								        });
								        infowindow.open(map, marker);
						
								   	} 
								});    
						<% } %>
						<% } %>
						

						<% if(address != null && address.contains("서구")){%>
							
							<% for (int i = 0 ; i < west_list.size() ; i++ ) {%>
									geocoder.addressSearch('<%=west_list.get(i).getAdress() %>' , function(result, status) {

									    // 정상적으로 검색이 완료됐으면 
									     if (status === kakao.maps.services.Status.OK) {

									        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
									        
									        // 결과값으로 받은 위치를 마커로 표시합니다
									        var marker = new kakao.maps.Marker({
									            map: map,
									            position: coords
									        });

									        // 인포윈도우로 장소에 대한 설명을 표시합니다
									        var infowindow = new kakao.maps.InfoWindow({
									            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=west_list.get(i).getName() %></div>',
									            clickable: true
									        });
									        infowindow.open(map, marker);
							
									   	} 
									});    
							<% } %>
							<% } %>
							
							<% if(address != null && address.contains("남구")){ %>
								 
								
							<% for (int i = 0 ; i < south_list.size() ; i++ ) {%>
										geocoder.addressSearch('<%=south_list.get(i).getAdress() %>' , function(result, status) {

										    // 정상적으로 검색이 완료됐으면 
										     if (status === kakao.maps.services.Status.OK) {

										        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
										        
										        // 결과값으로 받은 위치를 마커로 표시합니다
										        var marker = new kakao.maps.Marker({
										            map: map,
										            position: coords
										        });

										        // 인포윈도우로 장소에 대한 설명을 표시합니다
										        var infowindow = new kakao.maps.InfoWindow({
										            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=south_list.get(i).getName() %></div>',
										            clickable: true
										        });
										        infowindow.open(map, marker);
								
										   	} 
										});    
								<% } %>
								<% } %>
								
								<% if(address != null && address.contains("동구")){ %>
									 
									
								<% for (int i = 0 ; i < east_list.size() ; i++ ) { %>
											geocoder.addressSearch('<%=east_list.get(i).getAdress() %>' , function(result, status) {

											    // 정상적으로 검색이 완료됐으면 
											     if (status === kakao.maps.services.Status.OK) {

											        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
											        
											        // 결과값으로 받은 위치를 마커로 표시합니다
											        var marker = new kakao.maps.Marker({
											            map: map,
											            position: coords
											        });

											        // 인포윈도우로 장소에 대한 설명을 표시합니다
											        var infowindow = new kakao.maps.InfoWindow({
											            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=east_list.get(i).getName() %></div>',
											            clickable: true
											        });
											        infowindow.open(map, marker);
									
											   	} 
											});    
									<% } %>
									<% } %> 
									
								 <% if(address != null && address.contains("광산구")){ %>
									 
									<% for (int i = 0 ; i < kwang_list.size() ; i++ ) { %>
												geocoder.addressSearch('<%=kwang_list.get(i).getAdress() %>' , function(result, status) {

												    // 정상적으로 검색이 완료됐으면 
												     if (status === kakao.maps.services.Status.OK) {

												        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
												        
												        // 결과값으로 받은 위치를 마커로 표시합니다
												        var marker = new kakao.maps.Marker({
												            map: map,
												            position: coords
												        });

												        // 인포윈도우로 장소에 대한 설명을 표시합니다
												        var infowindow = new kakao.maps.InfoWindow({
												            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=kwang_list.get(i).getName() %></div>',
												            clickable: true
												        });
												        infowindow.open(map, marker);
												   	} 
												});    
										<% } %>
										<% } %>
															
						</script>
								
								<!-- 가입자의 주소를 기준으로 지도 중앙 표시  -->
								<script>
						 		
								<% if (loginVO != null && !address.contains("동구") && !address.contains("서구") && !address.contains("남구") && !address.contains("북구") && !address.contains("광산구") ) {%>
								
								
								// 주소로 좌표를 검색합니다 (표현식에 주소담기)
								geocoder.addressSearch('광주 동구 예술길 31-15' , function(result, status) {
						
						    	// 정상적으로 검색이 완료됐으면 
						     	if (status === kakao.maps.services.Status.OK) {
								
						     	// 주소를 좌표로 변환
						        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        let marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						            
						        });     
						        
						        // 말풍선으로 장소에 대한 설명을 표시합니다
						        let infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:10px 0;">스마트인재개발원</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						       
						    	} 
								});    
								<% } else { %>
								
								geocoder.addressSearch('<%=address %>' , function(result, status) {
									
							    	// 정상적으로 검색이 완료됐으면 
							     	if (status === kakao.maps.services.Status.OK) {
									
							     	// 주소를 좌표로 변환
							        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        let marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							            
							        });     
							        
							        // 말풍선으로 장소에 대한 설명을 표시합니다
							        let infowindow = new kakao.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:10px 0;">우리집</div>'
							        });
							        infowindow.open(map, marker);
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							       
							    	} 
									});    
								<% } %>
								
								</script>
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
<script type="text/javascript" src="./javascript/map.js"></script>
</html>

