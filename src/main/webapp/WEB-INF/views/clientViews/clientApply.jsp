<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<%@ include file="../form_client/header.jsp" %>
			
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
								<form:form action="client_insert?member_no=${user.member_no }" method="post">
									<table class="table table-sm" style="margin-bottom: 50px;">
										<tbody>
											<tr>
												<th>업체 이름</th>
												<td><input type="text" name="client_name"></td>
											</tr>
											<tr>
												<th>업체 전화번호</th>
												<td><input type="text" name="client_tel"></td>
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
								</form:form>
					</div>
				</div>
			</div>
			
			<!-- Footer -->
			<%@ include file="../form_client/footer.jsp" %>

		

</body>
</html>