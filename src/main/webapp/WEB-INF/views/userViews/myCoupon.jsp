<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>내 쿠폰함 페이지</title>
</head>
<body>

	<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>내 쿠폰함 </b><small> 현재 '${user.member_name }' 님께서 보유한 쿠폰입니다.</small>
			</h1>
		</div>
	</div>
	
	<div class="row">
		<table border="1">
			<tr>
				<th>메뉴고유번호</th>
				<th>제휴업체</th>
				<th>메뉴 이름</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
			<tr>
				<c:choose>
				<c:when test="${empty my_coupon }">
					<tr>
						<td colspan="3">-------보유한 쿠폰이 없습니다-------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${my_coupon }" var="dto">
						<tr>
							<td>${dto.menu_no }</td>
							<td>${dto.client_name }</td>
							<td><a href='my_coupon_detail?member_no=${user.member_no}&menu_no=${dto.menu_no }'>${dto.menu_title }</a></td>
							<td>${dto.menu_price }</td>
							<td>${dto.coupon_count }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tr>
		</table>
	</div>
		<hr>
		<input type="button" class="btn btn-default" value="메인으로" onclick="location.href='../home/main'"/>
	</div>

</body>
</html>