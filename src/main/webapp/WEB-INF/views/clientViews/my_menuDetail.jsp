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

<style>
th{width:15%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa;}
td{width:50%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
</style>

</head>

<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>

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
	

		<div  style="margin-top:200px; margin-bottom: 990px;">
		
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/메뉴관리.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">메뉴상세보기</h2>
			</div>
		</div>
		
		<br>
		<br>
			<div class="row justify-content-center">	
				<div class="col-md-6"  style="text-align: center;">
					<table class="table table-sm">
						<tbody>
							<tr>
								<th>메뉴이름</th>
								<td>${menu_dto.menu_title }</td>
							</tr>
							<tr>
								<th>메뉴가격</th>
								<td>${menu_dto.menu_price }</td>
							</tr>
							<tr>
							<th>메뉴이미지</th>
								<td><img style='width:200px; height:200px;' src="${menu_dto.menu_image }" ></td>
							</tr>
							<tr>
							<tr>
								<th>메뉴상세정보</th>
								<td>${menu_dto.menu_detail }</td>
							</tr>

						</tbody>
					</table>						
						<input type="button" onclick="location.href='menu_updateForm?menu_no=${menu_dto.menu_no}'" value="수정" class="btn btn-primary">
						<input type="button" onclick="location.href='menu_delete?menu_no=${menu_dto.menu_no}&client_no=${client.client_no }'" value="삭제" class="btn btn-primary">
						<input type="button" onclick="location.href='menu_list?client_no=${client.client_no}'" value="목록" class="btn btn-primary">
				</div>
			</div>
			
		</div>
	
	<!-- Footer -->
 	<%@ include file="../form_client/footer.jsp" %>

</body>
</html>