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
/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; margin-left: 350px; margin-right: 100px; margin-bottom: 30px;}

/* 화면에 보여지는 caption */
.list_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.list_table thead th { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table td { text-align: center;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; }

</style>

</head>

<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>
	
		<div  style="margin-top:200px; margin-bottom: 738px;">
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/메뉴관리.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">메뉴관리</h2>
			</div>
		</div>
		
		<br>
		<br>
			<div class="row justify-content-center" >	
				<table class="list_table">
						<colgroup>
							<col width="10%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<thead> 
							<tr> 
								<th>메뉴번호</th>
								<th>메뉴이름</th>
								<th>메뉴가격</th>
								<th>메뉴만든날짜</th>
							</tr>
						</thead>
				
							<c:choose>
								<c:when test="${empty menu_list }">
									<tr>
										<td>등록된 메뉴 없음</td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${menu_list }" var="menu_dto">
										<tr>
										<td>${menu_dto.menu_no }</td>
										<td><a href="menu_detail?menu_no=${menu_dto.menu_no}">${menu_dto.menu_title }</a></td>
										<td>${menu_dto.menu_price }</td>
										<td><fmt:formatDate value="${menu_dto.menu_create_date }" pattern="yyyy.MM.dd"/></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

				</table>

							<input type="button" value="메뉴추가" onclick="location.href='menu_insertForm'" class="btn btn-primary"/>
			</div>
		</div>
	
	<!-- Footer -->
 	<%@ include file="../form_client/footer.jsp" %>

</body>
</html>