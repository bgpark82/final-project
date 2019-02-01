<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>제휴업체 리스트</h1>

	<table border="1">
		<tr>
			<th>제휴업체 고유번호</th>
			<th>제휴업체 사장님 고유번호</th>
			<th>제휴업체 명</th>
			<th>제휴업체 전화번호</th>
			<th>제휴업체 주소</th>
			<th>제휴업체 신청현황</th>
			<th>제휴업체 최대 예약 가능인원</th>
			<th>제휴업체 예약 가능 여부</th>
			<th>결제코드</th>
			
		</tr>
		<c:choose>
			<c:when test="${empty client_list }">
				<tr>
					<td colspan="1">-------작성한 글이 없습니다-------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${client_list }" var="client_dto">
					<tr>
						<td>${client_dto.client_no }</td>
						<td>${client_dto.member_no }</td>
						<td><a href="client_detail?client_no=${client_dto.client_no}">${client_dto.client_name }</a></td>
						<td>${client_dto.client_tel }</td>
						<td>${client_dto.client_address }</td>
						<td>${client_dto.client_registration }</td>
						<td>${client_dto.client_max_client }</td>
						<td>${client_dto.client_reservation }</td>
						<td>${client_dto.client_paycode }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>




</body>
</html>