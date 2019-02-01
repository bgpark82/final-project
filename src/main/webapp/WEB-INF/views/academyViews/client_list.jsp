<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
	<h1>제휴업체 목록</h1> |<a href="../academy/client_registration_list">제휴업체 신청 목록</a> |
	<a href="../academy/purchase_statistics_page">업체별 쿠폰 구매 통계</a> |
	<a href="../academy/sale_statistics_page">업체별 쿠폰 판매 통계</a>
	<c:choose>
		<c:when test="${empty client_list}">
			<h3> ---- 제휴업체가 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>제휴업체 번호<td>사장님 고유번호 <td>업체명 <td>전화번호<td>주소<td>예약가능 인원 <td>예약가능 여부
				</tr>
				<c:forEach var="client_Dto" items="${client_list }">
					<tr>
						<td>${client_Dto.client_no }</td>
						<td>${client_Dto.member_no }</td>
						<td>${client_Dto.client_name} </td>
						<td>${client_Dto.client_tel }</td>
						<td>${client_Dto.client_address }</td>
						<td>${client_Dto.client_max_client }</td>
						<td>${client_Dto.client_reservation }</td>
						
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>