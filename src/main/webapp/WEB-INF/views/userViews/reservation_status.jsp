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


	<h1>메뉴상세보기</h1>



	<table border="1">
		<tr>
			<th>예약 고유번호</th>
			<td>${reservation_dto.reservation_no }</td>
		</tr>
		<tr>
			<th>멤버 고유번호</th>
			<td>${reservation_dto.member_no }</td>
		</tr>
		<tr>
			<th>제휴업체 고유번호</th>
			<td>${reservation_dto.client_no }</td>
		</tr>
		<tr>
			<th>제휴업체 고유번호</th>
			<td>${reservation_dto.member_phone }</td>
		</tr>
		<tr>
			<th>멤버 핸드폰번호</th>
			<td>${reservation_dto.reservation_date_request }</td>
		</tr>
		<tr>
			<th>예약생성날짜</th>
			<td>${reservation_dto.reservation_date }</td>
		</tr>
		<tr>
			<th>예약신청날짜</th>
			<td>${reservation_dto.reservation_date }</td>
		</tr>
		<tr>
			<th>예약인원</th>
			<td>${reservation_dto.reservation_people }</td>
		</tr>
		<tr>
			<th>예약시간</th>
			<td>${reservation_dto.reservation_time }</td>
		</tr>
		<tr>
			<th>예약확인</th>
			<td>${reservation_dto.reservation_confirm }</td>
		</tr>
		<tr>
			<th>예약시 요청사항</th>
			<td>${reservation_dto.reservation_memo }</td>
		</tr>
		<tr>
			<th>예약시 거부사유</th>
			<td>${reservation_dto.reservation_reject}</td>
		</tr>
		
		
		</table>	

</body>
</html>