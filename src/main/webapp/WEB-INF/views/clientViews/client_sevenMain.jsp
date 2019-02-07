<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>7GRAM 메인페이지</title>

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

</head>
<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>


	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container">
			<img class="img-fluid mb-5 d-block mx-auto"
				src="${pageContext.request.contextPath}/resources/img/profile.png"
				alt="">
			<h1 class="text-uppercase mb-2">7GAM 메인화면 입니다.<br>
			</h1>
		</div>
	</header>

	<!-- Portfolio Grid Section -->
	<section class="portfolio" id="portfolio">
		<div class="container">
			<h2 class="text-center text-uppercase text-secondary mb-0">제휴업체</h2>
			<hr class="star-dark mb-5">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fas fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/맥주창고.jpg" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-4">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fas fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/7gram.jpg" alt="">
					</a>
				</div>
				<div class="col-md-6 col-lg-4">
					<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-5">
						<div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
							<div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								<i class="fas fa-search-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/요술포차.png" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>

	<!-- 모달창들-->
	<!-- 로그인 모달창1 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">로그인</h2>
						<hr class="star-dark mb-5">
						<p class="mb-5">로그인 값 들어가는 부분</p>
						<a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"> <i class="fa fa-close"></i> Close </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원가입 모달창2 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">회원가입</h2>
						<hr class="star-dark mb-5">
						<p class="mb-5">회원가입 값 들어가는 부분</p>
						<a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"> <i class="fa fa-close"></i> Close </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 맥주창고 모달창3 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">맥주창고</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5"
							src="${pageContext.request.contextPath}/resources/img/맥주창고.jpg"
							alt="">
						<p class="mb-5">매일매일 메뉴가 바뀌는 가성비 최고의 점심뷔페입니다.</p>
						<a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"><i class="fa fa-close"></i>Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 7GRAM 모달창4 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">7GRAM</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="${pageContext.request.contextPath}/resources/img/7gram.jpg" alt="">
						<p class="mb-5">KH학생들을 위해 쿠폰을 판매하고있는 7GRAM 카페 입니다.</p>
						<a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"><i class="fa fa-close"></i>Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 요술포차 모달창5 -->
	<div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
		<div class="portfolio-modal-dialog bg-white">
			<a class="close-button d-none d-md-block portfolio-modal-dismiss"
				href="#"> <i class="fa fa-3x fa-times"></i>
			</a>
			<div class="container text-center">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="text-secondary text-uppercase mb-0">요술포차</h2>
						<hr class="star-dark mb-5">
						<img class="img-fluid mb-5" src="${pageContext.request.contextPath}/resources/img/요술포차.png" alt="">
						<p class="mb-5">KH학생들에게 할인 메뉴가격 적용! 예약제로 운영됩니다. </p>
						<a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#"><i class="fa fa-close"></i>Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>
		
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




