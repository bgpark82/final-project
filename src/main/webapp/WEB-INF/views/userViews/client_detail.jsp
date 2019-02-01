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

	<h1>제휴업체 상세보기</h1>



	<table border="1">
		<tr>
			<th>제휴업체 명</th>
			<td>${client_dto.client_name }</td>
		</tr>
		<tr>
			<th>제휴업체 전화번호</th>
			<td>${client_dto.client_tel }</td>
		</tr>
		<tr>
			<th>제휴업체 주소</th>
			<td>${client_dto.client_address }</td>
		</tr>
		<tr>
			<th>제휴업체 신청현황</th>
			<td>${client_dto.client_registration }</td>
		</tr>
		<tr>
			<th>제휴업체 최대예약가능인원</th>
			<td>${client_dto.client_max_client }</td>
		</tr>
		<tr>
			<th>제휴업체 예약 가능 여부</th>
			<td>${client_dto.client_reservation }</td>
		</tr>
		<tr>
			<th>결제코드</th>
			<td>${client_dto.client_paycode }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="메뉴보기"
				onclick="location.href='menu_list?client_no=${client_dto.client_no}'" />
		
			</td>
		</tr>

	</table>


</body>
</html>