<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>후기 수정 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

	<h1>후기 수정하기</h1>
	<form:form action="../user/review_update?board_no=${dto.board_no }" method="post">
	<table border="1">
	<tr>
		<th>작성자</th>
		<td>${dto.board_writer }</td>
	</tr>
	<tr>
		<th>제휴업체</th>
		<td>${dto.board_category }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" value="${dto.board_title }" name="board_title"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" value="${dto.board_content }" name="board_content"/></td>
	</tr>
	</table>
	<hr>
	<input type="button" value="취소" onclick="location.href='review_board_list?board_category=${dto.board_category}'"/>
	<input type="submit" value="수정완료"/>
	</form:form>
</body>
</html>