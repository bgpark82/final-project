<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 글수정</h1>
	
	<form action="../academy/notice_update">
		<input type="hidden" name="board_no" value="${boardDto.board_no }">
	<table border="1">
		<tr>
			<th>카테고리</th>
			<td><input type="text" value=${boardDto.board_category } readonly="readonly"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" value="${boardDto.board_writer }" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td align="left"><input type="text" name="board_title" value="${boardDto.board_title }"/></td> 
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="board_content">${boardDto.board_content }</textarea></td>
		</tr>
	</table>
	<hr>
		<input type="submit" value="수정">
		<input type="button" value="취소" class="btn btn-default" onclick="location.href='../academy/board_detail?board_no=${boardDto.board_no}'"/>
	</form>
</body>
</html>