<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>메뉴게시판</h1>

	<table border="1">
		<tr>
			<th>메뉴 고유 번호</th>
			<th>제휴업체 고유 번호</th>
			<th>제휴업체 이름</th>
			<th>메뉴 이름</th>
			<th>메뉴 가격</th>
			<th>메뉴 이미지</th>
			<th>메뉴 상세정보</th>
			<th>메뉴 등록날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty menu_list }">
				<tr>
					<td colspan="1">-------작성한 글이 없습니다-------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${menu_list }" var="menu_dto">
					<tr>
						<td>${menu_dto.menu_no }</td>
						<td>${menu_dto.client_no }</td>
						<td>${menu_dto.client_name }</td>
						<td>${menu_dto.menu_title }</td>
						<td>${menu_dto.menu_price }</td>
						<td>${menu_dto.menu_image }</td>
						<td>${menu_dto.menu_detail }</td>
						<td>${menu_dto.menu_create_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="8"><input type="button" value="예약"
				onclick="location.href='reservationForm?client_no=${client_no}'" /></td>
		</tr>
	</table>
</body>
</html>