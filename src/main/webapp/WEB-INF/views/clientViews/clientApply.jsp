<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>제휴업체 문의페이지</title>

<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">

<style>
th{width:30%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa;}
td{width:70%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
</style>

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
								<li><a id="zz" href="#">제휴업체<i class='fa fa-angle-down'></i></a>
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
			
				<!-- Header -->
			<header class="masthead bg-primary text-white text-center">
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/제휴업체문의.png" alt="">
			<h2>제휴업체문의</h2>
			</header>

			<div class="container text-center" style="margin-bottom: 100px;">
				<div class="row">
					<div class="col-lg-8 mx-auto">
							<br>
							<br>
							<p class="mb-5">
								<form action="client_insert?member_no=${client_dto.member_no }" method="post">
									<table class="table table-sm" style="margin-bottom: 50px;">
										<tbody>
											<tr>
												<th>업체 이름</th>
												<td><input type="text" name="client_name_store"></td>
											</tr>
											<tr>
												<th>업체 전화번호</th>
												<td><input type="text" name="client_phone_store"></td>
											</tr>
											<tr>
												<th>업체 주소</th>
												<td><input type="text" name="client_address"></td>
											</tr>
											<tr>
												<th>업체 최대 수용인원</th>
												<td><input type="text" name="client_max_client"></td>
											</tr>
											<tr>
												<th>업체 예약</th>
												<td><input type="radio" name="client_reservation" id="radio2" value="Y">예
												<input type="radio" name="client_reservation" id="radio2" value="N">아니오</td>
											</tr>
										</tbody>
									</table>					
										<input type="submit" value="문의신청" class="btn btn-primary"/>
								</form>

					</div>
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