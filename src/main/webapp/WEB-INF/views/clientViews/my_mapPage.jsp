<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는길 페이지</title>

<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">

<!-- 사이드 메뉴바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenubar.css">

</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="clientMain">KHC</a>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				카테고리<i class="fas fa-bars"></i>
			</button>

			<!-- 드롭다운 -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul>
						<li><a href="#">제휴업체<i class='fa fa-angle-down'></i></a>
							<ul>
								<li><a href="client_beerMain">맥주창고</a></li>
								<li><a href="client_sevenMain">7GRAM</a></li>
								<li><a href="client_magicMain">요술포차</a></li>
							</ul>
						</li>

						<li><a href="#">커뮤니티<i class='fa fa-angle-down'></i></a>
							<ul>
								<li><a href="#">공지사항</a></li>
								<li><a href="complain_board_list">건의사항</a></li>
								<li><a href="review_board_list">이용후기</a></li>
							</ul>
						</li>

						<li><a href="#">마이페이지<i class='fa fa-angle-down'></i></a>
							<ul>
								<li><a href="myPage?member_no=${regist_dto.member_no }">내 업체 정보</a></li>
								<li><a href="my_salesPage">매출현황</a></li>
								<li><a href="menu_list?client_no=${client_dto.client_no }">메뉴관리</a></li>
								<li><a href="my_mapPage">오시는길</a></li>
							</ul>
						</li>

				</ul>
			</div>
		</div>
			<h6 style="color:white;">${regist_dto.member_name } 님  환영합니다.</h6>

	</nav>

	<!-- 왼쪽 메뉴바 -->
	<aside class="sidebar">
	<br>
		<div id="leftside-navigation" class="nano">
			<ul class="nano-content">
				<li class="sub-menu">
					<a href="myPage?member_no=${regist_dto.member_no }">
					<i class="fa fa-file"></i><span>내 업체 정보</span><i class="arrow fa fa-angle-right pull-right"></i></a>
				</li>
				<li class="my_salesPage">
					<a href="my_salesPage">
					<i class="fa fa-bar-chart-o"></i><span>매출현황</span><i class="arrow fa fa-angle-right pull-right"></i></a>
				</li>
				<li class="sub-menu">
					<a href="menu_list?client_no=${client_dto.client_no }">
					<i class="fa fa fa-tasks"></i><span>메뉴 관리</span><i class="arrow fa fa-angle-right pull-right"></i></a>
				</li>
				<li class="sub-menu">
					<a href="my_mapPage">
					<i class="fa fa-map-marker"></i><span>오시는길</span><i class="arrow fa fa-angle-right pull-right"></i></a>
				</li>
			</ul>
		</div>
	</aside>
	<!-- 왼쪽메뉴바 끝 -->
	
	<!-- 지도나오는 부분 -->
	<div  style="margin-top:200px; margin-bottom: 804px;">
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/오시는길.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">오시는길</h2>
			</div>
		</div>
		
		<br>
		
		<div class="row justify-content-center">	
			<div>
				<div style="height:400px; width:400px;" id="map"></div>
			</div>	
		</div>
	</div>

	
	<!-- Footer -->
	<footer class="footer text-center" style="margin-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">KH정보교육원</h4>
					<h4 class="text-uppercase mb-2">@(주)세훈팩토리</h4>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">제휴업체 문의</h4>
					<h4 class="text-uppercase mb-4">전화: 010-1234-1234</h4>
					<h4 class="text-uppercase mb-4">주소: 서울특별시 테헤란로 1000-1</h4>
				</div>
				<div style="margin-left: 100px;">
				<input type="button" value="제휴업체문의" onclick="location.href='insertform'" class="btn btn-primary" style="padding: 1rem 1.75rem; font-size: 1.25rem; "/>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript (네비게이션 바 연관)-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

	<!-- Plugin JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js" />"></script>
	
	<!-- Custom scripts for this template -->
	<script src="<c:url value="/resources/js/freelancer.min.js" />"></script>

	<!-- 드롭다운 -->
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$('nav li').hover(function() {
			$('ul', this).stop().slideDown(200);
		}, function() {
			$('ul', this).stop().slideUp(200);
		});
	</script>

 	<!-- 지도api -->
	<script>
    		  var map;
   		   function initMap() {
    		    map = new google.maps.Map(document.getElementById('map'), {
     		     center: {lat: 37.500653, lng: 127.034143},
      		    zoom: 17
      		  });
     		 }
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZJabmz4nl1CgHEFdKOc_KqapQt7N1m-s&callback=initMap" async defer></script>

</body>
</html>