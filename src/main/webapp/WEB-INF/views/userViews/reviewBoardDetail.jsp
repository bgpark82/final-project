<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>후기 상세 페이지</title>
</head>
<body>

	<h1>후기 상세보기</h1>
	
	<table border="1">
	<tr>
		<th>작성자</th>
		<td>${dto.review_writer }</td>
	</tr>
	<tr>
		<th>구분</th>
		<td>${dto.review_category }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.review_title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${dto.review_content }</td>
	</tr>
	</table>
	<hr>
	<input type="button" value="목록" onclick="location.href='review_board_list'"/>
	<input type="button" value="수정" onclick="location.href='review_updateform?review_no=${dto.review_no}'"/>
	<input type="button" value="삭제" onclick="location.href='review_delete?review_no=${dto.review_no}'"/>
</body>
</html>