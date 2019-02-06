<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황 페이지</title>

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

<!-- 메뉴목록 style --> 
<style>
th{width:100%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa;}
td{width:100%; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
</style>


</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="clientMain">KHC</a>
			<button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
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
				<li class="sub-menu">
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
		<div  style="margin-top:200px; margin-bottom: 759px;">
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/메뉴관리.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">메뉴추가</h2>
			</div>
		</div>
		
		<br>
		<br>
			<div class="row justify-content-center">	

			<form action="menu_insert" method="post"  style="text-align: center;">
			<input type="hidden" name="client_no" value="${client_dto.client_no }">
									<table class="table table-sm">
										<tbody>
											<tr>
												<th>메뉴이름</th>
												<td><input type="text" name="menu_title" /></td>
											</tr>
											<tr>
												<th>메뉴가격</th>
												<td><input type="text" name="menu_price" /></td>
											</tr>
											<tr>
											<th>메뉴이미지</th>
												<td><input type="hidden" name="menu_image" /></td>
											</tr>
											<tr>
												<th>메뉴상세정보</th>
												<td><textarea rows="10" cols="60" id="editor" name="menu_detail"></textarea></td>
											</tr>

										</tbody>
									</table>
										<input type="submit"  value="추가" class="btn btn-primary">
										<input type="button" onclick="location.href='menu_list?client_no=${client_dto.client_no }'" value="취소" class="btn btn-primary">		
			</form>
								
			</div>
		</div>
	
	<!-- Footer -->
 	<footer class="footer text-center">
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

</body>
</html>