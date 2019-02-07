<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	
		<div  style="margin-top:200px; margin-bottom: 972px;">
		
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/메뉴관리.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">메뉴수정</h2>
			</div>
		</div>
		<br>
		<br>
			<div class="row justify-content-center">	
				<div class="col-md-6">
				<form:form action="menu_update" method="post" style="text-align: center;">
				<input type="hidden" name="menu_no" value="${menu_dto.menu_no }">
					<table class="table table-sm">
						<tbody>
							<tr>
								<th>메뉴이름</th>
								<td><input type="text" name="menu_title" value="${menu_dto.menu_title }" /></td>
							</tr>
							<tr>
								<th>메뉴가격</th>
								<td><input type="text" name="menu_price" value="${menu_dto.menu_price }" /></td>
							</tr>
							<tr>
								<th>메뉴이미지</th>
								<td><img style='width:200px; height:200px;' src="${menu_dto.menu_image }" ></td>
							</tr>
							<tr>
							<tr>
								<th>메뉴상세정보</th>
								<td><input type="text" name="menu_detail" value="${menu_dto.menu_detail }" /></td>
							</tr>

						</tbody>
					</table>						
						<input type="submit" value="수정" class="btn btn-primary">
						<input type="button" value="취소" onclick="location.href='menu_detail?menu_no=${menu_dto.menu_no}'" class="btn btn-primary"/>
				</form:form>
				</div>
			</div>
			
		</div>
	
	<!-- Footer -->
 	<%@ include file="../form_client/footer.jsp" %>
</body>
</html>