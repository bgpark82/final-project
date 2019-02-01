<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>회식 예약</h1>
	${client_dto.client_name }
	<form:form action="reservation" method="post">
	<input type="hidden" name="member_no" value="${member_dto.member_no }">
		<table border="1">
			<tr>
				<th>예약자 폰번호</th>
				<td><input type="text" name="member_phone" value="${member_dto.member_phone }"></td>
			</tr>
			<tr>
				<th>예약신청날짜</th>
				<td><input type="text" name="reservation_date"></td>
			</tr>
			<tr>
				<th>예약인원</th>
				<td><input type="text" name="reservation_people"></td>
			</tr>
			<tr>
				<th>예약시간</th>
				<td><input type="text" name="reservation_time"></td>
			</tr>
			<tr>
				<th>예약시 요청 사항</th>
				<td><input type="text" name="reservation_memo"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="예약"></td>
			</tr>
		</table>
	</form:form>

</body>
</html>