<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
th{width:30%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa;}
td{width:70%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
</style>
<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>

	
		<div  style="margin-top:200px; margin-bottom: 1095px;">
		
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/내업체정보.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">내 업체 정보</h2>
			</div>
		</div>
		
		<br>
		
		<div class="row justify-content-center">	
			<div class="col-md-6">
				<table class="table table-sm">

					<tbody>
						<tr>
							<th>이름</th>
							<td>${user.member_name }</td>
						</tr>
						<tr>
							<th>ID</th>
							<td>${user.member_id }</td>
						</tr>
						<tr>
							<th>PASSWORD</th>
							<td>${user.member_password }</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		
		</div>
	
	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>


	
	
</body>
</html>